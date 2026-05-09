# Mandi App — Agent Context

## Architecture

```
lib/
├── main.dart                              # Entry point: DI setup, OpenPanel init, error boundaries
├── core/
│   ├── locator.dart                       # get_it DI — singletons, lazySingletons, factories
│   ├── constants/
│   │   ├── environment.dart               # Appwrite project ID, OpenPanel config, design tokens
│   │   ├── appwrite_collections.dart      # Database collection IDs
│   │   └── realtime_channels.dart         # Realtime subscription channels
│   ├── models/
│   │   ├── user.dart                      # User model (from Appwrite doc)
│   │   └── app_error.dart                 # Typed error: ErrorType enum + AppError with factory ctors
│   ├── services/
│   │   ├── client_service.dart            # Appwrite Client singleton (+ Account, Storage, Functions)
│   │   ├── auth_service.dart              # Login/logout/register + session check + realtime session events
│   │   ├── user_service.dart              # Current user state (ValueNotifier), fetch/refresh/clear
│   │   ├── user_repository.dart           # Appwrite DB operations for user documents
│   │   ├── realtime_service.dart          # Appwrite realtime subscription wrapper
│   │   ├── image_service.dart             # Pick + upload avatar to Appwrite storage
│   │   ├── dialog_service.dart            # Modal dialogs (confirmations, errors)
│   │   ├── banner_service.dart            # Flushbar banners + snackbars
│   │   ├── error_display_service.dart     # Routes AppError → dialog/banner per severity
│   │   ├── shared_preferences_service.dart # Local storage wrapper
│   │   ├── app_info_service.dart          # Package info (version, build number)
│   │   ├── theme_service.dart             # Locale + ThemeMode persistent state
│   │   ├── news_service.dart              # News feed from Appwrite
│   │   └── analytics_service.dart         # OpenPanel wrapper: identify, events, exceptions, pageviews
│   ├── utils/
│   │   ├── error_handler.dart             # Exception → AppError mapping (Appwrite, Socket, Timeout)
│   │   └── logger.dart                    # Simple tagged logger
│   ├── viewmodels/
│   │   ├── base_view_model.dart           # isBusy + errorMessage ValueNotifiers
│   │   ├── auth_view_model.dart           # Login/register/logout/account deletion flow
│   │   ├── home_view_model.dart           # Current user exposure
│   │   └── profile_view_model.dart        # Logout, avatar, privacy policy
│   └── router/
│       └── app_router.dart                # GoRouter config, redirect logic, OpenPanelObserver
├── ui/
│   ├── common/
│   │   ├── theme.dart                     # getLightTheme() / getDarkTheme()
│   │   └── view_model_builder.dart        # Generic VM builder widget
│   ├── views/
│   │   ├── login_view.dart                # Login screen
│   │   ├── registration_view.dart         # Registration screen
│   │   ├── home_view.dart                 # Post-login landing
│   │   ├── profile_view.dart              # User profile, settings, reservations, privacy, logout
│   │   ├── settings_view.dart             # Language, theme, danger zone (delete account)
│   │   ├── reservations_view.dart         # "Coming soon" placeholder
│   │   ├── privacy_policy_view.dart       # WebView with styled HTML
│   │   ├── shell_view.dart                # Bottom nav shell (home + profile tabs)
│   │   └── auth_guard.dart                # Legacy — switches login/home based on auth
│   └── widgets/
│       ├── common/                        # ActionTile, BaseActionCard, MandiDivider, RadioTile, SectionHeader
│       ├── profile/                       # UserInfoCard, AppVersionFooter
│       ├── shell/                         # BugReportDialog
│       ├── login_content.dart
│       ├── registration_content.dart
│       └── delete_progress_bottom_sheet.dart
├── i18n/
│   └── strings.g.dart                     # slang generated translations (nl, en, ar)
├── test/
│   └── widget_test.dart
├── android/                               # Android platform
├── ios/                                   # iOS platform
├── linux/                                 # Linux platform (branch: chore/linux-support)
└── assets/
    └── images/
```

## Key Patterns

### Dependency Injection
- Singleton: `GlobalKey<NavigatorState>`, `AnalyticsService`, `AppInfoService`, `SharedPrefs`, `ClientService`, `RealtimeService`, `AuthViewModel`, `HomeViewModel`
- LazySingleton: `UserService`, `AuthService`, `UserRepository`, `ImageService`, `ThemeService`, `DialogService`, `BannerService`, `ErrorDisplayService`
- Factory: `ProfileViewModel` (new instance per use via `ViewModelBuilder`)
- Access: ViewModels use `locator<Type>()` directly; services use constructor injection

### Routing (go_router)
- Routes: `/login`, `/register`, `/settings`, `/reservationsView`, `/privacyPolicyView`, `ShellRoute(/home, /profile)`
- Auth redirect: unauthenticated → `/login`, authenticated on `/login` or `/register` → `/home`
- Page tracking: `OpenpanelObserver` auto-fires `screen_view` events

### Error Handling Flow
```
Exception → ErrorHandler.handleException() → AppError → ErrorDisplayService.showError()
                                                           ↓
                                              AnalyticsService.trackException()
```
Unhandled errors: `FlutterError.onError` + `PlatformDispatcher.instance.onError` → `AnalyticsService`

### Analytics (OpenPanel)
- `AnalyticsService` (wrapper): `identifyUser`, `trackEvent`, `trackException`, `trackPageView`, `clear`
- Auto pageviews: `OpenpanelObserver` (go_router observer)
- Manual events: user_login, user_register, user_logout, account_deletion_*, avatar_updated, language_changed, theme_changed, privacy_policy_opened
- Exceptions: tracked via `ErrorDisplayService.showError()` + global error handlers in main.dart
- User ID: synced via auth state listener in `AppRouter._onUserChanged()`

## Branches
- `feat/openpanel-analytics` — current, has analytics integration + docs
- `chore/linux-support` — Linux desktop platform files
- `chore/skills-config` — agent skills, FVM config
