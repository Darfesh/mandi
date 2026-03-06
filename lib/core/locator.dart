import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mandi/core/services/app_info_service.dart';
import 'package:mandi/core/services/auth_service.dart';
import 'package:mandi/core/services/banner_service.dart';
import 'package:mandi/core/services/client_service.dart';
import 'package:mandi/core/services/user_repository.dart';
import 'package:mandi/core/services/dialog_service.dart';
import 'package:mandi/core/services/error_display_service.dart';
import 'package:mandi/core/services/image_service.dart';
import 'package:mandi/core/services/realtime_service.dart';
import 'package:mandi/core/services/shared_preferences_service.dart';
import 'package:mandi/core/services/theme_service.dart';
import 'package:mandi/core/services/user_service.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';
import 'package:mandi/core/viewmodels/home_view_model.dart';
import 'package:mandi/core/viewmodels/profile_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerSingleton(GlobalKey<NavigatorState>());
  locator.registerSingleton(AppInfoService());
  locator.registerSingleton(SharedPreferencesService());
  locator.registerSingleton(ClientService());
  locator.registerSingleton(RealtimeService());

  locator.registerLazySingleton(() => UserService(
        realtimeService: locator<RealtimeService>(),
        clientService: locator<ClientService>(),
      ));

  locator.registerLazySingleton(() => AuthService(
        clientService: locator<ClientService>(),
        realtimeService: locator<RealtimeService>(),
        userService: locator<UserService>(),
      ));
  locator.registerLazySingleton(
    () => UserRepository(
      databases: Databases(locator<ClientService>().client),
    ),
  );

  locator.registerLazySingleton(() => ImageService(
        clientService: locator<ClientService>(),
        userService: locator<UserService>(),
      ));

  locator.registerLazySingleton(() => ThemeService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BannerService(
        locator<GlobalKey<NavigatorState>>(),
      ));
  locator.registerLazySingleton(() => ErrorDisplayService(
        locator<BannerService>(),
        locator<DialogService>(),
      ));

  // ViewModels
  locator.registerSingleton(AuthViewModel());
  locator.registerSingleton(HomeViewModel());
  locator.registerFactory(() => ProfileViewModel());
}
