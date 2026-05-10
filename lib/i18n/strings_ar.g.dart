///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppAr app = _TranslationsAppAr._(_root);
	@override late final _TranslationsNavigationAr navigation = _TranslationsNavigationAr._(_root);
	@override late final _TranslationsHomeAr home = _TranslationsHomeAr._(_root);
	@override late final _TranslationsCommonAr common = _TranslationsCommonAr._(_root);
	@override late final _TranslationsDialogAr dialog = _TranslationsDialogAr._(_root);
	@override late final _TranslationsErrorsAr errors = _TranslationsErrorsAr._(_root);
	@override late final _TranslationsProfileAr profile = _TranslationsProfileAr._(_root);
	@override late final _TranslationsSettingsAr settings = _TranslationsSettingsAr._(_root);
	@override late final _TranslationsNewsAr news = _TranslationsNewsAr._(_root);
	@override late final _TranslationsAuthAr auth = _TranslationsAuthAr._(_root);
}

// Path: app
class _TranslationsAppAr implements TranslationsAppEn {
	_TranslationsAppAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get name => 'ماندي';
}

// Path: navigation
class _TranslationsNavigationAr implements TranslationsNavigationEn {
	_TranslationsNavigationAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get news => 'الأخبار';
	@override String get profile => 'الملف الشخصي';
}

// Path: home
class _TranslationsHomeAr implements TranslationsHomeEn {
	_TranslationsHomeAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get welcome => 'أهلاً وسهلاً';
}

// Path: common
class _TranslationsCommonAr implements TranslationsCommonEn {
	_TranslationsCommonAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get logout => 'تسجيل الخروج';
	@override String get cancel => 'إلغاء';
	@override String get confirm => 'تأكيد';
	@override String get save => 'حفظ';
	@override String get delete => 'حذف';
	@override String get ok => 'حسناً';
	@override String get close => 'إغلاق';
	@override String get yes => 'نعم';
	@override String get no => 'لا';
}

// Path: dialog
class _TranslationsDialogAr implements TranslationsDialogEn {
	_TranslationsDialogAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDialogErrorAr error = _TranslationsDialogErrorAr._(_root);
	@override late final _TranslationsDialogConfirmationAr confirmation = _TranslationsDialogConfirmationAr._(_root);
	@override late final _TranslationsDialogInfoAr info = _TranslationsDialogInfoAr._(_root);
}

// Path: errors
class _TranslationsErrorsAr implements TranslationsErrorsEn {
	_TranslationsErrorsAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsErrorsTitlesAr titles = _TranslationsErrorsTitlesAr._(_root);
	@override late final _TranslationsErrorsMessagesAr messages = _TranslationsErrorsMessagesAr._(_root);
	@override late final _TranslationsErrorsActionsAr actions = _TranslationsErrorsActionsAr._(_root);
}

// Path: profile
class _TranslationsProfileAr implements TranslationsProfileEn {
	_TranslationsProfileAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الملف الشخصي';
	@override String get settings => 'الإعدادات';
	@override String get myReservations => 'حجوزاتي';
	@override String memberSince({required Object year}) => 'عضو منذ ${year}';
	@override String myReservationsNrThisMonth({required Object reservationsThisMonth}) => 'حجوزاتي هذا الشهر ${reservationsThisMonth}';
	@override String get logout => 'تسجيل الخروج';
	@override late final _TranslationsProfileLogoutDialogAr logoutDialog = _TranslationsProfileLogoutDialogAr._(_root);
}

// Path: settings
class _TranslationsSettingsAr implements TranslationsSettingsEn {
	_TranslationsSettingsAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الإعدادات';
	@override late final _TranslationsSettingsLanguageAr language = _TranslationsSettingsLanguageAr._(_root);
	@override late final _TranslationsSettingsThemeAr theme = _TranslationsSettingsThemeAr._(_root);
}

// Path: news
class _TranslationsNewsAr implements TranslationsNewsEn {
	_TranslationsNewsAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get empty => 'لا توجد أخبار متاحة';
	@override String get title => 'الأخبار';
}

// Path: auth
class _TranslationsAuthAr implements TranslationsAuthEn {
	_TranslationsAuthAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get login => 'تسجيل الدخول';
	@override String get logout => 'تسجيل الخروج';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get notLoggedIn => 'غير مسجل الدخول';
	@override String get registerHere => 'سجِّل هنا';
}

// Path: dialog.error
class _TranslationsDialogErrorAr implements TranslationsDialogErrorEn {
	_TranslationsDialogErrorAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'خطأ';
	@override String get defaultMessage => 'حدث خطأ ما';
	@override String get details => 'التفاصيل';
	@override String get close => 'إغلاق';
}

// Path: dialog.confirmation
class _TranslationsDialogConfirmationAr implements TranslationsDialogConfirmationEn {
	_TranslationsDialogConfirmationAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get defaultTitle => 'تأكيد';
	@override String get defaultMessage => 'هل أنت متأكد؟';
	@override String get confirm => 'تأكيد';
	@override String get cancel => 'إلغاء';
}

// Path: dialog.info
class _TranslationsDialogInfoAr implements TranslationsDialogInfoEn {
	_TranslationsDialogInfoAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'معلومات';
	@override String get ok => 'حسناً';
}

// Path: errors.titles
class _TranslationsErrorsTitlesAr implements TranslationsErrorsTitlesEn {
	_TranslationsErrorsTitlesAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get network => 'خطأ في الشبكة';
	@override String get timeout => 'انتهت المهلة';
	@override String get sessionExpired => 'انتهت الجلسة';
	@override String get unauthorized => 'لا يوجد وصول';
	@override String get invalidCredentials => 'فشل تسجيل الدخول';
	@override String get fileNotFound => 'الملف غير موجود';
	@override String get fileTooLarge => 'الملف كبير جداً';
	@override String get invalidFileType => 'نوع ملف غير صالح';
	@override String get permissionDenied => 'لا يوجد وصول';
	@override String get permissionPermanentlyDenied => 'الوصول مطلوب';
	@override String get serverError => 'خطأ في الخادم';
	@override String get rateLimitExceeded => 'طلبات كثيرة جداً';
	@override String get notFound => 'غير موجود';
	@override String get validation => 'خطأ في التحقق';
	@override String get unknown => 'خطأ';
}

// Path: errors.messages
class _TranslationsErrorsMessagesAr implements TranslationsErrorsMessagesEn {
	_TranslationsErrorsMessagesAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get network => 'لا يوجد اتصال بالإنترنت';
	@override String get timeout => 'انتهت مهلة الطلب';
	@override String get sessionExpired => 'انتهت جلستك. الرجاء تسجيل الدخول مرة أخرى.';
	@override String get unauthorized => 'ليس لديك إذن للوصول إلى هذا.';
	@override String get invalidCredentials => 'بريد إلكتروني أو كلمة مرور غير صالحة.';
	@override String get fileNotFound => 'الملف غير موجود';
	@override String get fileTooLarge => 'الملف كبير جداً';
	@override String get invalidFileType => 'نوع ملف غير صالح';
	@override String get permissionDenied => 'لم تمنح إذن استخدام الصور.';
	@override String get permissionPermanentlyDenied => 'انتقل إلى الإعدادات لمنح الوصول إلى الصور.';
	@override String get serverError => 'حدث خطأ ما. الرجاء المحاولة لاحقاً.';
	@override String get rateLimitExceeded => 'طلبات كثيرة جداً. يرجى الانتظار.';
	@override String get notFound => 'المورد غير موجود';
	@override String validationWithField({required Object field, required Object reason}) => '${field} غير صالح: ${reason}';
	@override String get unknown => 'حدث خطأ غير متوقع.';
}

// Path: errors.actions
class _TranslationsErrorsActionsAr implements TranslationsErrorsActionsEn {
	_TranslationsErrorsActionsAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get goToSettings => 'الذهاب إلى الإعدادات';
}

// Path: profile.logoutDialog
class _TranslationsProfileLogoutDialogAr implements TranslationsProfileLogoutDialogEn {
	_TranslationsProfileLogoutDialogAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تسجيل الخروج';
	@override String get message => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';
	@override String get confirm => 'تسجيل الخروج';
	@override String get cancel => 'إلغاء';
}

// Path: settings.language
class _TranslationsSettingsLanguageAr implements TranslationsSettingsLanguageEn {
	_TranslationsSettingsLanguageAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اللغة';
	@override String get dutch => 'Nederlands';
	@override String get english => 'English';
	@override String get arabic => 'العربية';
}

// Path: settings.theme
class _TranslationsSettingsThemeAr implements TranslationsSettingsThemeEn {
	_TranslationsSettingsThemeAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'العرض';
	@override String get light => 'فاتح';
	@override String get lightDesc => 'الوضع الفاتح دائماً';
	@override String get system => 'النظام';
	@override String get systemDesc => 'اتبع إعداد الجهاز';
	@override String get dark => 'داكن';
	@override String get darkDesc => 'الوضع الداكن دائماً';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'ماندي',
			'navigation.news' => 'الأخبار',
			'navigation.profile' => 'الملف الشخصي',
			'home.welcome' => 'أهلاً وسهلاً',
			'common.logout' => 'تسجيل الخروج',
			'common.cancel' => 'إلغاء',
			'common.confirm' => 'تأكيد',
			'common.save' => 'حفظ',
			'common.delete' => 'حذف',
			'common.ok' => 'حسناً',
			'common.close' => 'إغلاق',
			'common.yes' => 'نعم',
			'common.no' => 'لا',
			'dialog.error.title' => 'خطأ',
			'dialog.error.defaultMessage' => 'حدث خطأ ما',
			'dialog.error.details' => 'التفاصيل',
			'dialog.error.close' => 'إغلاق',
			'dialog.confirmation.defaultTitle' => 'تأكيد',
			'dialog.confirmation.defaultMessage' => 'هل أنت متأكد؟',
			'dialog.confirmation.confirm' => 'تأكيد',
			'dialog.confirmation.cancel' => 'إلغاء',
			'dialog.info.title' => 'معلومات',
			'dialog.info.ok' => 'حسناً',
			'errors.titles.network' => 'خطأ في الشبكة',
			'errors.titles.timeout' => 'انتهت المهلة',
			'errors.titles.sessionExpired' => 'انتهت الجلسة',
			'errors.titles.unauthorized' => 'لا يوجد وصول',
			'errors.titles.invalidCredentials' => 'فشل تسجيل الدخول',
			'errors.titles.fileNotFound' => 'الملف غير موجود',
			'errors.titles.fileTooLarge' => 'الملف كبير جداً',
			'errors.titles.invalidFileType' => 'نوع ملف غير صالح',
			'errors.titles.permissionDenied' => 'لا يوجد وصول',
			'errors.titles.permissionPermanentlyDenied' => 'الوصول مطلوب',
			'errors.titles.serverError' => 'خطأ في الخادم',
			'errors.titles.rateLimitExceeded' => 'طلبات كثيرة جداً',
			'errors.titles.notFound' => 'غير موجود',
			'errors.titles.validation' => 'خطأ في التحقق',
			'errors.titles.unknown' => 'خطأ',
			'errors.messages.network' => 'لا يوجد اتصال بالإنترنت',
			'errors.messages.timeout' => 'انتهت مهلة الطلب',
			'errors.messages.sessionExpired' => 'انتهت جلستك. الرجاء تسجيل الدخول مرة أخرى.',
			'errors.messages.unauthorized' => 'ليس لديك إذن للوصول إلى هذا.',
			'errors.messages.invalidCredentials' => 'بريد إلكتروني أو كلمة مرور غير صالحة.',
			'errors.messages.fileNotFound' => 'الملف غير موجود',
			'errors.messages.fileTooLarge' => 'الملف كبير جداً',
			'errors.messages.invalidFileType' => 'نوع ملف غير صالح',
			'errors.messages.permissionDenied' => 'لم تمنح إذن استخدام الصور.',
			'errors.messages.permissionPermanentlyDenied' => 'انتقل إلى الإعدادات لمنح الوصول إلى الصور.',
			'errors.messages.serverError' => 'حدث خطأ ما. الرجاء المحاولة لاحقاً.',
			'errors.messages.rateLimitExceeded' => 'طلبات كثيرة جداً. يرجى الانتظار.',
			'errors.messages.notFound' => 'المورد غير موجود',
			'errors.messages.validationWithField' => ({required Object field, required Object reason}) => '${field} غير صالح: ${reason}',
			'errors.messages.unknown' => 'حدث خطأ غير متوقع.',
			'errors.actions.goToSettings' => 'الذهاب إلى الإعدادات',
			'profile.title' => 'الملف الشخصي',
			'profile.settings' => 'الإعدادات',
			'profile.myReservations' => 'حجوزاتي',
			'profile.memberSince' => ({required Object year}) => 'عضو منذ ${year}',
			'profile.myReservationsNrThisMonth' => ({required Object reservationsThisMonth}) => 'حجوزاتي هذا الشهر ${reservationsThisMonth}',
			'profile.logout' => 'تسجيل الخروج',
			'profile.logoutDialog.title' => 'تسجيل الخروج',
			'profile.logoutDialog.message' => 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
			'profile.logoutDialog.confirm' => 'تسجيل الخروج',
			'profile.logoutDialog.cancel' => 'إلغاء',
			'settings.title' => 'الإعدادات',
			'settings.language.title' => 'اللغة',
			'settings.language.dutch' => 'Nederlands',
			'settings.language.english' => 'English',
			'settings.language.arabic' => 'العربية',
			'settings.theme.title' => 'العرض',
			'settings.theme.light' => 'فاتح',
			'settings.theme.lightDesc' => 'الوضع الفاتح دائماً',
			'settings.theme.system' => 'النظام',
			'settings.theme.systemDesc' => 'اتبع إعداد الجهاز',
			'settings.theme.dark' => 'داكن',
			'settings.theme.darkDesc' => 'الوضع الداكن دائماً',
			'news.empty' => 'لا توجد أخبار متاحة',
			'news.title' => 'الأخبار',
			'auth.login' => 'تسجيل الدخول',
			'auth.logout' => 'تسجيل الخروج',
			'auth.email' => 'البريد الإلكتروني',
			'auth.password' => 'كلمة المرور',
			'auth.notLoggedIn' => 'غير مسجل الدخول',
			'auth.registerHere' => 'سجِّل هنا',
			_ => null,
		};
	}
}
