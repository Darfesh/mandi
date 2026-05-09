class Environment {
  /// Project ID's
  static const String appwriteProjectId = '68ceaf1c0003f5c4f746';
  static const String appwriteProjectName = 'Mandi';
  static const String appwritePublicEndpoint = 'https://fra.cloud.appwrite.io/v1';

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
    defaultValue: 'https://openpanel.usemandi.com',
  );
  static const String openpanelClientId = String.fromEnvironment(
    'OPENPANEL_CLIENT_ID',
    defaultValue: '8b70b8a1-caed-496d-b13d-b2df4da4fce3',
  );
  static const String openpanelClientSecret = String.fromEnvironment(
    'OPENPANEL_CLIENT_SECRET',
    defaultValue: '',
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
