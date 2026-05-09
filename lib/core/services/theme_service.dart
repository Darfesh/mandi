import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/services/analytics_service.dart';
import 'package:mandi/core/services/shared_preferences_service.dart';
import 'package:mandi/i18n/strings.g.dart';
import 'package:mandi/core/utils/logger.dart';

class ThemeService {
  static const String _languageKey = 'app_language';
  static const String _themeModeKey = 'theme_mode';

  final ValueNotifier<Locale> _locale;
  final ValueNotifier<ThemeMode> _themeMode;

  ValueListenable<Locale> get locale => _locale;
  ValueListenable<ThemeMode> get themeMode => _themeMode;

  String get currentLanguage => _locale.value.languageCode;
  bool get isDarkMode => _themeMode.value == ThemeMode.dark;

  final _prefsService = locator<SharedPreferencesService>();

  ThemeService()
      : _locale = ValueNotifier(const Locale('en')),
        _themeMode = ValueNotifier(ThemeMode.system) {
    _loadPreferences();
    Logger.init(runtimeType.toString());
  }

  void _loadPreferences() {
    try {
      // Language
      final savedLanguage = _prefsService.getString(
        _languageKey,
        defaultValue: 'en',
      );
      if (savedLanguage != null) {
        _locale.value = Locale(savedLanguage);
        LocaleSettings.setLocaleRaw(savedLanguage);
        Logger.info(runtimeType.toString(), 'Loaded language: $savedLanguage');
      }

      // Load theme mode
      final savedThemeIndex = _prefsService.getInt(
        _themeModeKey,
        // System theme
        defaultValue: 1,
      );
      if (savedThemeIndex != null) {
        _themeMode.value = ThemeMode.values[savedThemeIndex];
      }
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Failed to load preferences: $e');
    }
  }

  // Change language
  Future<void> setLanguage(String languageCode) async {
    try {
      _locale.value = Locale(languageCode);
      LocaleSettings.setLocaleRaw(languageCode);

      await _prefsService.setString(_languageKey, languageCode);
      locator<AnalyticsService>().trackEvent('language_changed', properties: {
        'language': languageCode,
      });
      Logger.info(runtimeType.toString(), 'Language changed to: $languageCode');
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Failed to save language: $e');
    }
  }

  // Change theme mode
  Future<void> setThemeMode(ThemeMode mode) async {
    try {
      _themeMode.value = mode;
      await _prefsService.setInt(_themeModeKey, mode.index);
      locator<AnalyticsService>().trackEvent('theme_changed', properties: {
        'theme': mode.name,
      });
      Logger.info(runtimeType.toString(), 'Theme mode changed to: $mode');
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Failed to save theme mode: $e');
    }
  }

  Future<void> toggleTheme() async {
    final current = themeMode.value;
    final next = current == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setThemeMode(next);
  }

  void dispose() {
    _locale.dispose();
    _themeMode.dispose();
    Logger.disposed(runtimeType.toString());
  }
}
