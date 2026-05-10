class Environment {
  /// Project ID's
  /// Override with --dart-define=APPWRITE_PROJECT_ID=... at build time.
  static const String appwriteProjectId = String.fromEnvironment(
    'APPWRITE_PROJECT_ID',
    defaultValue: '69ff92820015f53bf31c',
  );
  static const String appwriteProjectName = 'Mandi';
  /// Override with --dart-define=APPWRITE_ENDPOINT=... at build time.
  static const String appwritePublicEndpoint = String.fromEnvironment(
    'APPWRITE_ENDPOINT',
    defaultValue: 'http://localhost/v1',
  );

  /// Real-time channels
  // Account
  static const String accountChannel = 'account';

  // Database
  static const String databaseId = '68d2cc0a00207193ffeb';

  // Storage
  static const String bucketID = '698f385b00095eb336ac';

  /// OpenPanel Analytics
  /// Override with --dart-define at build time.
  /// Client secret should be injected by CI/CD, not committed.
  static const String openpanelUrl = String.fromEnvironment(
    'OPENPANEL_URL',
    defaultValue: 'https://openpanel.usemandi.com/api',
  );
  static const String openpanelClientId = String.fromEnvironment(
    'OPENPANEL_CLIENT_ID',
    defaultValue: '8e2a996d-20a6-4d8d-9d9a-cef8ffd2fddb',
  );
  static const String openpanelClientSecret = String.fromEnvironment(
    'OPENPANEL_CLIENT_SECRET',
    defaultValue: 'sec_5af5c7615e1c4fd94427',
  );

  // Design constants
  static const double size4 = 4.0;
  static const double size8 = 8.0;
  static const double size12 = 12.0;
  static const double size16 = 16.0;
  static const double size24 = 24.0;
  static const double size32 = 32.0;
  static const double size40 = 40.0;
}
