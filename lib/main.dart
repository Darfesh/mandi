import 'package:flutter/material.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/router/app_router.dart';
import 'package:mandi/core/services/app_info_service.dart';
import 'package:mandi/core/services/shared_preferences_service.dart';
import 'package:mandi/core/services/theme_service.dart';
import 'package:mandi/ui/common/theme.dart';
import 'package:mandi/i18n/strings.g.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:openpanel_flutter/openpanel_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  setupLocator();

  await Openpanel.instance.initialize(
    options: OpenpanelOptions(
      url: Environment.openpanelUrl,
      clientId: Environment.openpanelClientId,
      clientSecret: Environment.openpanelClientSecret.isNotEmpty
          ? Environment.openpanelClientSecret
          : null,
    ),
  );

  await locator<SharedPreferencesService>().initialize();
  await locator<AppInfoService>().initialize();
  runApp(TranslationProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = locator<ThemeService>();

    return ListenableBuilder(
      listenable: Listenable.merge([
        themeService.locale,
        themeService.themeMode,
      ]),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Mandi',
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          themeMode: themeService.themeMode.value,
          routerConfig: _appRouter.router,
        );
      },
    );
  }
}
