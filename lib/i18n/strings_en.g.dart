///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEn app = TranslationsAppEn._(_root);
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsDialogEn dialog = TranslationsDialogEn._(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn._(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsNewsEn news = TranslationsNewsEn._(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Mandi'
	String get name => 'Mandi';
}

// Path: navigation
class TranslationsNavigationEn {
	TranslationsNavigationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News'
	String get news => 'News';

	/// en: 'Profile'
	String get profile => 'Profile';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome'
	String get welcome => 'Welcome';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Close'
	String get close => 'Close';

	/// en: 'Yes'
	String get yes => 'Yes';

	/// en: 'No'
	String get no => 'No';
}

// Path: dialog
class TranslationsDialogEn {
	TranslationsDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsDialogErrorEn error = TranslationsDialogErrorEn._(_root);
	late final TranslationsDialogConfirmationEn confirmation = TranslationsDialogConfirmationEn._(_root);
	late final TranslationsDialogInfoEn info = TranslationsDialogInfoEn._(_root);
}

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsErrorsTitlesEn titles = TranslationsErrorsTitlesEn._(_root);
	late final TranslationsErrorsMessagesEn messages = TranslationsErrorsMessagesEn._(_root);
	late final TranslationsErrorsActionsEn actions = TranslationsErrorsActionsEn._(_root);
}

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Profile'
	String get title => 'Profile';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'My Reservations'
	String get myReservations => 'My Reservations';

	/// en: 'Member since $year'
	String memberSince({required Object year}) => 'Member since ${year}';

	/// en: 'My reservations this month $reservationsThisMonth'
	String myReservationsNrThisMonth({required Object reservationsThisMonth}) => 'My reservations this month ${reservationsThisMonth}';

	/// en: 'Logout'
	String get logout => 'Logout';

	late final TranslationsProfileLogoutDialogEn logoutDialog = TranslationsProfileLogoutDialogEn._(_root);
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	late final TranslationsSettingsLanguageEn language = TranslationsSettingsLanguageEn._(_root);
	late final TranslationsSettingsThemeEn theme = TranslationsSettingsThemeEn._(_root);
}

// Path: news
class TranslationsNewsEn {
	TranslationsNewsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No news available'
	String get empty => 'No news available';

	/// en: 'News'
	String get title => 'News';
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Email address'
	String get email => 'Email address';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Not logged in'
	String get notLoggedIn => 'Not logged in';

	/// en: 'Register here'
	String get registerHere => 'Register here';
}

// Path: dialog.error
class TranslationsDialogErrorEn {
	TranslationsDialogErrorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Error'
	String get title => 'Error';

	/// en: 'Something went wrong'
	String get defaultMessage => 'Something went wrong';

	/// en: 'Details'
	String get details => 'Details';

	/// en: 'Close'
	String get close => 'Close';
}

// Path: dialog.confirmation
class TranslationsDialogConfirmationEn {
	TranslationsDialogConfirmationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Confirm'
	String get defaultTitle => 'Confirm';

	/// en: 'Are you sure?'
	String get defaultMessage => 'Are you sure?';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Cancel'
	String get cancel => 'Cancel';
}

// Path: dialog.info
class TranslationsDialogInfoEn {
	TranslationsDialogInfoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Information'
	String get title => 'Information';

	/// en: 'OK'
	String get ok => 'OK';
}

// Path: errors.titles
class TranslationsErrorsTitlesEn {
	TranslationsErrorsTitlesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Network Error'
	String get network => 'Network Error';

	/// en: 'Timeout'
	String get timeout => 'Timeout';

	/// en: 'Session Expired'
	String get sessionExpired => 'Session Expired';

	/// en: 'No Access'
	String get unauthorized => 'No Access';

	/// en: 'Login Failed'
	String get invalidCredentials => 'Login Failed';

	/// en: 'File Not Found'
	String get fileNotFound => 'File Not Found';

	/// en: 'File Too Large'
	String get fileTooLarge => 'File Too Large';

	/// en: 'Invalid File Type'
	String get invalidFileType => 'Invalid File Type';

	/// en: 'No Access'
	String get permissionDenied => 'No Access';

	/// en: 'Access Required'
	String get permissionPermanentlyDenied => 'Access Required';

	/// en: 'Server Error'
	String get serverError => 'Server Error';

	/// en: 'Too Many Requests'
	String get rateLimitExceeded => 'Too Many Requests';

	/// en: 'Not Found'
	String get notFound => 'Not Found';

	/// en: 'Validation Error'
	String get validation => 'Validation Error';

	/// en: 'Error'
	String get unknown => 'Error';
}

// Path: errors.messages
class TranslationsErrorsMessagesEn {
	TranslationsErrorsMessagesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No internet connection'
	String get network => 'No internet connection';

	/// en: 'Request timed out'
	String get timeout => 'Request timed out';

	/// en: 'Your session has expired. Please login again.'
	String get sessionExpired => 'Your session has expired. Please login again.';

	/// en: 'You don't have permission to access this.'
	String get unauthorized => 'You don\'t have permission to access this.';

	/// en: 'Invalid email or password.'
	String get invalidCredentials => 'Invalid email or password.';

	/// en: 'File not found'
	String get fileNotFound => 'File not found';

	/// en: 'File is too large'
	String get fileTooLarge => 'File is too large';

	/// en: 'Invalid file type'
	String get invalidFileType => 'Invalid file type';

	/// en: 'You haven't given permission to use photos.'
	String get permissionDenied => 'You haven\'t given permission to use photos.';

	/// en: 'Go to Settings to grant access to photos.'
	String get permissionPermanentlyDenied => 'Go to Settings to grant access to photos.';

	/// en: 'Something went wrong. Please try again later.'
	String get serverError => 'Something went wrong. Please try again later.';

	/// en: 'Too many requests. Please slow down.'
	String get rateLimitExceeded => 'Too many requests. Please slow down.';

	/// en: 'Resource not found'
	String get notFound => 'Resource not found';

	/// en: 'Invalid $field: $reason'
	String validationWithField({required Object field, required Object reason}) => 'Invalid ${field}: ${reason}';

	/// en: 'An unexpected error occurred.'
	String get unknown => 'An unexpected error occurred.';
}

// Path: errors.actions
class TranslationsErrorsActionsEn {
	TranslationsErrorsActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Go to Settings'
	String get goToSettings => 'Go to Settings';
}

// Path: profile.logoutDialog
class TranslationsProfileLogoutDialogEn {
	TranslationsProfileLogoutDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Logout'
	String get title => 'Logout';

	/// en: 'Are you sure you want to logout?'
	String get message => 'Are you sure you want to logout?';

	/// en: 'Logout'
	String get confirm => 'Logout';

	/// en: 'Cancel'
	String get cancel => 'Cancel';
}

// Path: settings.language
class TranslationsSettingsLanguageEn {
	TranslationsSettingsLanguageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Language'
	String get title => 'Language';

	/// en: 'Nederlands'
	String get dutch => 'Nederlands';

	/// en: 'English'
	String get english => 'English';

	/// en: 'العربية'
	String get arabic => 'العربية';
}

// Path: settings.theme
class TranslationsSettingsThemeEn {
	TranslationsSettingsThemeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Display'
	String get title => 'Display';

	/// en: 'Light'
	String get light => 'Light';

	/// en: 'Always light mode'
	String get lightDesc => 'Always light mode';

	/// en: 'System'
	String get system => 'System';

	/// en: 'Follow device setting'
	String get systemDesc => 'Follow device setting';

	/// en: 'Dark'
	String get dark => 'Dark';

	/// en: 'Always dark mode'
	String get darkDesc => 'Always dark mode';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Mandi',
			'navigation.news' => 'News',
			'navigation.profile' => 'Profile',
			'home.welcome' => 'Welcome',
			'common.logout' => 'Logout',
			'common.cancel' => 'Cancel',
			'common.confirm' => 'Confirm',
			'common.save' => 'Save',
			'common.delete' => 'Delete',
			'common.ok' => 'OK',
			'common.close' => 'Close',
			'common.yes' => 'Yes',
			'common.no' => 'No',
			'dialog.error.title' => 'Error',
			'dialog.error.defaultMessage' => 'Something went wrong',
			'dialog.error.details' => 'Details',
			'dialog.error.close' => 'Close',
			'dialog.confirmation.defaultTitle' => 'Confirm',
			'dialog.confirmation.defaultMessage' => 'Are you sure?',
			'dialog.confirmation.confirm' => 'Confirm',
			'dialog.confirmation.cancel' => 'Cancel',
			'dialog.info.title' => 'Information',
			'dialog.info.ok' => 'OK',
			'errors.titles.network' => 'Network Error',
			'errors.titles.timeout' => 'Timeout',
			'errors.titles.sessionExpired' => 'Session Expired',
			'errors.titles.unauthorized' => 'No Access',
			'errors.titles.invalidCredentials' => 'Login Failed',
			'errors.titles.fileNotFound' => 'File Not Found',
			'errors.titles.fileTooLarge' => 'File Too Large',
			'errors.titles.invalidFileType' => 'Invalid File Type',
			'errors.titles.permissionDenied' => 'No Access',
			'errors.titles.permissionPermanentlyDenied' => 'Access Required',
			'errors.titles.serverError' => 'Server Error',
			'errors.titles.rateLimitExceeded' => 'Too Many Requests',
			'errors.titles.notFound' => 'Not Found',
			'errors.titles.validation' => 'Validation Error',
			'errors.titles.unknown' => 'Error',
			'errors.messages.network' => 'No internet connection',
			'errors.messages.timeout' => 'Request timed out',
			'errors.messages.sessionExpired' => 'Your session has expired. Please login again.',
			'errors.messages.unauthorized' => 'You don\'t have permission to access this.',
			'errors.messages.invalidCredentials' => 'Invalid email or password.',
			'errors.messages.fileNotFound' => 'File not found',
			'errors.messages.fileTooLarge' => 'File is too large',
			'errors.messages.invalidFileType' => 'Invalid file type',
			'errors.messages.permissionDenied' => 'You haven\'t given permission to use photos.',
			'errors.messages.permissionPermanentlyDenied' => 'Go to Settings to grant access to photos.',
			'errors.messages.serverError' => 'Something went wrong. Please try again later.',
			'errors.messages.rateLimitExceeded' => 'Too many requests. Please slow down.',
			'errors.messages.notFound' => 'Resource not found',
			'errors.messages.validationWithField' => ({required Object field, required Object reason}) => 'Invalid ${field}: ${reason}',
			'errors.messages.unknown' => 'An unexpected error occurred.',
			'errors.actions.goToSettings' => 'Go to Settings',
			'profile.title' => 'Profile',
			'profile.settings' => 'Settings',
			'profile.myReservations' => 'My Reservations',
			'profile.memberSince' => ({required Object year}) => 'Member since ${year}',
			'profile.myReservationsNrThisMonth' => ({required Object reservationsThisMonth}) => 'My reservations this month ${reservationsThisMonth}',
			'profile.logout' => 'Logout',
			'profile.logoutDialog.title' => 'Logout',
			'profile.logoutDialog.message' => 'Are you sure you want to logout?',
			'profile.logoutDialog.confirm' => 'Logout',
			'profile.logoutDialog.cancel' => 'Cancel',
			'settings.title' => 'Settings',
			'settings.language.title' => 'Language',
			'settings.language.dutch' => 'Nederlands',
			'settings.language.english' => 'English',
			'settings.language.arabic' => 'العربية',
			'settings.theme.title' => 'Display',
			'settings.theme.light' => 'Light',
			'settings.theme.lightDesc' => 'Always light mode',
			'settings.theme.system' => 'System',
			'settings.theme.systemDesc' => 'Follow device setting',
			'settings.theme.dark' => 'Dark',
			'settings.theme.darkDesc' => 'Always dark mode',
			'news.empty' => 'No news available',
			'news.title' => 'News',
			'auth.login' => 'Login',
			'auth.logout' => 'Logout',
			'auth.email' => 'Email address',
			'auth.password' => 'Password',
			'auth.notLoggedIn' => 'Not logged in',
			'auth.registerHere' => 'Register here',
			_ => null,
		};
	}
}
