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

## Appwrite Architecture

### ClientService (singleton)
Central Appwrite SDK instance. All services use it via DI — no ad-hoc `Databases(client)` or `Storage(client)` creation.

```
ClientService
  ├── Client     (endpoint + project)
  ├── Account    (auth: sessions, identities)
  ├── Databases  (document CRUD)
  ├── Storage    (file upload/delete)
  └── Realtime   (WebSocket subscriptions)
```

### Environment Configuration (`--dart-define`)

| Var | Default (local) | Release override |
|---|---|---|
| `APPWRITE_ENDPOINT` | `http://localhost:3002/v1` | `https://api.usemandi.com/v1` |
| `APPWRITE_PROJECT_ID` | `69fe5fa2002f9dc1783e` | `69ff292b00143eec6816` |
| `APPWRITE_DATABASE_ID` | `mandi_main` | `68d2cc0a00207193ffeb` |
| `APPWRITE_BUCKET_ID` | `mandi_avatars` | `698f385b00095eb336ac` |

### Database Schema

#### Collection: `users`
| Field | Type | Required | Notes |
|---|---|---|---|
| `userId` | string | yes | Links to Appwrite Auth `$id` |
| `email` | string | yes | |
| `fullName` | string | yes | |
| `displayName` | string? | no | |
| `avatarUrl` | string? | no | Public URL to avatar in storage |
| `status` | string? | no | `active` / `pendingDeletion` |
| `accountMarkedForDeletionDate` | string? | no | ISO8601 timestamp |

#### Collection: `news`
| Field | Type | Required | Notes |
|---|---|---|---|
| `title` | string | yes | |
| `content` | string | yes | |
| `authorName` | string | yes | |
| `createdAt` | string | yes | ISO8601 |
| `isRtl` | bool | no | Right-to-left text support |
| `imageUrl` | string? | no | |
| `category` | string? | no | Future: link to `categories` or inline |

#### Future collections
- `categories` — for news categorization (RTL-aware: `name`, `slug`, `isRtl`)
- `reservations` — planned feature

### Storage Bucket: `mandi_avatars`
- File ID pattern: `avatar_{userId}`
- Permissions: `read(any)`, `update(user)`, `delete(user)`

### Launch Configurations (VS Code)

| Config | Profile | Endpoint | Database | Bucket |
|---|---|---|---|---|
| Debug Local (Android Emulator) | debug | `http://10.0.2.2:3002/v1` | `mandi_main` | `mandi_avatars` |
| Profile Local (Android Emulator) | profile | `http://10.0.2.2:3002/v1` | `mandi_main` | `mandi_avatars` |
| Debug Local | debug | defaults | defaults | defaults |
| Profile Local | profile | defaults | defaults | defaults |
| Release | release | hosted | hosted | hosted |

### Setting Up a New Local Environment

1. Start Appwrite (`appwrite start` or via Podman/Docker)
2. Open console at `http://localhost:3002`
3. Create project `mandi` (or use existing `69fe5fa2002f9dc1783e`)
4. Create database **mandi_main**
5. Create collection **users** with schema above
6. Create collection **news** with schema above
7. Create bucket **mandi_avatars** with `read(any)` permission
8. Play Store: Add Flutter Android platform for `com.example.mandi`

## Appwrite Functions

### `account-cleanup` (Dart)
Cron job die dagelijks accounts permanent verwijdert die 30+ dagen geleden zijn gemarkeerd voor verwijdering.

**Locatie:** `functions/account-cleanup/`

**Flow:**
1. Query `users` waar `status == 'pendingDeletion'` en `accountMarkedForDeletionDate` > 30 dagen oud
2. Verwijder avatar uit storage bucket
3. Verwijder user document
4. Verwijder Appwrite Auth user

**Deployen:**
```bash
appwrite push functions --all --force
```

**Benodigde API key scopes:**
- `databases.read` / `databases.write`
- `storage.write`
- `users.read` / `users.write`

**Schedule:** cron `0 0 * * *` (dagelijks middernacht)

**Omgevingsvariabelen:** `APPWRITE_DATABASE_ID`, `APPWRITE_BUCKET_ID`, `APPWRITE_API_KEY`

## Branches
- `feat/openpanel-analytics` — current, has analytics integration + docs
- `chore/linux-support` — Linux desktop platform files
- `chore/skills-config` — agent skills, FVM config
