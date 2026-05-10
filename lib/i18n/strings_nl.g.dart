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
class TranslationsNl with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsNl({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.nl,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <nl>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsNl _root = this; // ignore: unused_field

	@override 
	TranslationsNl $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsNl(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAppNl app = _TranslationsAppNl._(_root);
	@override late final _TranslationsNavigationNl navigation = _TranslationsNavigationNl._(_root);
	@override late final _TranslationsHomeNl home = _TranslationsHomeNl._(_root);
	@override late final _TranslationsCommonNl common = _TranslationsCommonNl._(_root);
	@override late final _TranslationsDialogNl dialog = _TranslationsDialogNl._(_root);
	@override late final _TranslationsErrorsNl errors = _TranslationsErrorsNl._(_root);
	@override late final _TranslationsProfileNl profile = _TranslationsProfileNl._(_root);
	@override late final _TranslationsSettingsNl settings = _TranslationsSettingsNl._(_root);
	@override late final _TranslationsNewsNl news = _TranslationsNewsNl._(_root);
	@override late final _TranslationsAuthNl auth = _TranslationsAuthNl._(_root);
}

// Path: app
class _TranslationsAppNl implements TranslationsAppEn {
	_TranslationsAppNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get name => 'Mandi';
}

// Path: navigation
class _TranslationsNavigationNl implements TranslationsNavigationEn {
	_TranslationsNavigationNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get news => 'Nieuws';
	@override String get profile => 'Profiel';
}

// Path: home
class _TranslationsHomeNl implements TranslationsHomeEn {
	_TranslationsHomeNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get welcome => 'Welkom';
}

// Path: common
class _TranslationsCommonNl implements TranslationsCommonEn {
	_TranslationsCommonNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get logout => 'Uitloggen';
	@override String get cancel => 'Annuleren';
	@override String get confirm => 'Bevestigen';
	@override String get save => 'Opslaan';
	@override String get delete => 'Verwijderen';
	@override String get ok => 'OK';
	@override String get close => 'Sluiten';
	@override String get yes => 'Ja';
	@override String get no => 'Nee';
}

// Path: dialog
class _TranslationsDialogNl implements TranslationsDialogEn {
	_TranslationsDialogNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsDialogErrorNl error = _TranslationsDialogErrorNl._(_root);
	@override late final _TranslationsDialogConfirmationNl confirmation = _TranslationsDialogConfirmationNl._(_root);
	@override late final _TranslationsDialogInfoNl info = _TranslationsDialogInfoNl._(_root);
}

// Path: errors
class _TranslationsErrorsNl implements TranslationsErrorsEn {
	_TranslationsErrorsNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsErrorsTitlesNl titles = _TranslationsErrorsTitlesNl._(_root);
	@override late final _TranslationsErrorsMessagesNl messages = _TranslationsErrorsMessagesNl._(_root);
	@override late final _TranslationsErrorsActionsNl actions = _TranslationsErrorsActionsNl._(_root);
}

// Path: profile
class _TranslationsProfileNl implements TranslationsProfileEn {
	_TranslationsProfileNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profiel';
	@override String get settings => 'Instellingen';
	@override String get myReservations => 'Mijn Reserveringen';
	@override String memberSince({required Object year}) => 'Lid sinds ${year}';
	@override String myReservationsNrThisMonth({required Object reservationsThisMonth}) => 'Mijn reserveringen deze maand ${reservationsThisMonth}';
	@override String get logout => 'Uitloggen';
	@override late final _TranslationsProfileLogoutDialogNl logoutDialog = _TranslationsProfileLogoutDialogNl._(_root);
}

// Path: settings
class _TranslationsSettingsNl implements TranslationsSettingsEn {
	_TranslationsSettingsNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instellingen';
	@override late final _TranslationsSettingsLanguageNl language = _TranslationsSettingsLanguageNl._(_root);
	@override late final _TranslationsSettingsThemeNl theme = _TranslationsSettingsThemeNl._(_root);
}

// Path: news
class _TranslationsNewsNl implements TranslationsNewsEn {
	_TranslationsNewsNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Geen nieuws beschikbaar';
	@override String get title => 'Nieuws';
}

// Path: auth
class _TranslationsAuthNl implements TranslationsAuthEn {
	_TranslationsAuthNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get login => 'Inloggen';
	@override String get logout => 'Uitloggen';
	@override String get email => 'E-mailadres';
	@override String get password => 'Wachtwoord';
	@override String get notLoggedIn => 'Niet ingelogd';
	@override String get registerHere => 'Registreer hier';
}

// Path: dialog.error
class _TranslationsDialogErrorNl implements TranslationsDialogErrorEn {
	_TranslationsDialogErrorNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Fout';
	@override String get defaultMessage => 'Er is iets misgegaan';
	@override String get details => 'Details';
	@override String get close => 'Sluiten';
}

// Path: dialog.confirmation
class _TranslationsDialogConfirmationNl implements TranslationsDialogConfirmationEn {
	_TranslationsDialogConfirmationNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get defaultTitle => 'Bevestigen';
	@override String get defaultMessage => 'Weet je het zeker?';
	@override String get confirm => 'Bevestigen';
	@override String get cancel => 'Annuleren';
}

// Path: dialog.info
class _TranslationsDialogInfoNl implements TranslationsDialogInfoEn {
	_TranslationsDialogInfoNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Informatie';
	@override String get ok => 'OK';
}

// Path: errors.titles
class _TranslationsErrorsTitlesNl implements TranslationsErrorsTitlesEn {
	_TranslationsErrorsTitlesNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get network => 'Netwerkfout';
	@override String get timeout => 'Time-out';
	@override String get sessionExpired => 'Sessie Verlopen';
	@override String get unauthorized => 'Geen Toegang';
	@override String get invalidCredentials => 'Login Mislukt';
	@override String get fileNotFound => 'Bestand Niet Gevonden';
	@override String get fileTooLarge => 'Bestand Te Groot';
	@override String get invalidFileType => 'Ongeldig Bestandstype';
	@override String get permissionDenied => 'Geen Toegang';
	@override String get permissionPermanentlyDenied => 'Toegang Vereist';
	@override String get serverError => 'Serverfout';
	@override String get rateLimitExceeded => 'Te Veel Verzoeken';
	@override String get notFound => 'Niet Gevonden';
	@override String get validation => 'Validatiefout';
	@override String get unknown => 'Fout';
}

// Path: errors.messages
class _TranslationsErrorsMessagesNl implements TranslationsErrorsMessagesEn {
	_TranslationsErrorsMessagesNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get network => 'Geen internetverbinding';
	@override String get timeout => 'Verzoek duurde te lang';
	@override String get sessionExpired => 'Je sessie is verlopen. Log opnieuw in.';
	@override String get unauthorized => 'Je hebt geen toestemming om dit te openen.';
	@override String get invalidCredentials => 'Ongeldig e-mailadres of wachtwoord.';
	@override String get fileNotFound => 'Bestand niet gevonden';
	@override String get fileTooLarge => 'Bestand is te groot';
	@override String get invalidFileType => 'Ongeldig bestandstype';
	@override String get permissionDenied => 'Je hebt geen toestemming gegeven om foto\'s te gebruiken.';
	@override String get permissionPermanentlyDenied => 'Ga naar Instellingen om toegang tot foto\'s te geven.';
	@override String get serverError => 'Er is iets misgegaan. Probeer het later opnieuw.';
	@override String get rateLimitExceeded => 'Te veel verzoeken. Wacht even.';
	@override String get notFound => 'Bron niet gevonden';
	@override String validationWithField({required Object field, required Object reason}) => 'Ongeldig ${field}: ${reason}';
	@override String get unknown => 'Er is een onverwachte fout opgetreden.';
}

// Path: errors.actions
class _TranslationsErrorsActionsNl implements TranslationsErrorsActionsEn {
	_TranslationsErrorsActionsNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get goToSettings => 'Naar Instellingen';
}

// Path: profile.logoutDialog
class _TranslationsProfileLogoutDialogNl implements TranslationsProfileLogoutDialogEn {
	_TranslationsProfileLogoutDialogNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Uitloggen';
	@override String get message => 'Weet je zeker dat je wilt uitloggen?';
	@override String get confirm => 'Uitloggen';
	@override String get cancel => 'Annuleren';
}

// Path: settings.language
class _TranslationsSettingsLanguageNl implements TranslationsSettingsLanguageEn {
	_TranslationsSettingsLanguageNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Taal';
	@override String get dutch => 'Nederlands';
	@override String get english => 'English';
	@override String get arabic => 'العربية';
}

// Path: settings.theme
class _TranslationsSettingsThemeNl implements TranslationsSettingsThemeEn {
	_TranslationsSettingsThemeNl._(this._root);

	final TranslationsNl _root; // ignore: unused_field

	// Translations
	@override String get title => 'Weergave';
	@override String get light => 'Licht';
	@override String get lightDesc => 'Altijd lichte modus';
	@override String get system => 'Systeem';
	@override String get systemDesc => 'Volg iPhone/iPad instelling';
	@override String get dark => 'Donker';
	@override String get darkDesc => 'Altijd donkere modus';
}

/// The flat map containing all translations for locale <nl>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsNl {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.name' => 'Mandi',
			'navigation.news' => 'Nieuws',
			'navigation.profile' => 'Profiel',
			'home.welcome' => 'Welkom',
			'common.logout' => 'Uitloggen',
			'common.cancel' => 'Annuleren',
			'common.confirm' => 'Bevestigen',
			'common.save' => 'Opslaan',
			'common.delete' => 'Verwijderen',
			'common.ok' => 'OK',
			'common.close' => 'Sluiten',
			'common.yes' => 'Ja',
			'common.no' => 'Nee',
			'dialog.error.title' => 'Fout',
			'dialog.error.defaultMessage' => 'Er is iets misgegaan',
			'dialog.error.details' => 'Details',
			'dialog.error.close' => 'Sluiten',
			'dialog.confirmation.defaultTitle' => 'Bevestigen',
			'dialog.confirmation.defaultMessage' => 'Weet je het zeker?',
			'dialog.confirmation.confirm' => 'Bevestigen',
			'dialog.confirmation.cancel' => 'Annuleren',
			'dialog.info.title' => 'Informatie',
			'dialog.info.ok' => 'OK',
			'errors.titles.network' => 'Netwerkfout',
			'errors.titles.timeout' => 'Time-out',
			'errors.titles.sessionExpired' => 'Sessie Verlopen',
			'errors.titles.unauthorized' => 'Geen Toegang',
			'errors.titles.invalidCredentials' => 'Login Mislukt',
			'errors.titles.fileNotFound' => 'Bestand Niet Gevonden',
			'errors.titles.fileTooLarge' => 'Bestand Te Groot',
			'errors.titles.invalidFileType' => 'Ongeldig Bestandstype',
			'errors.titles.permissionDenied' => 'Geen Toegang',
			'errors.titles.permissionPermanentlyDenied' => 'Toegang Vereist',
			'errors.titles.serverError' => 'Serverfout',
			'errors.titles.rateLimitExceeded' => 'Te Veel Verzoeken',
			'errors.titles.notFound' => 'Niet Gevonden',
			'errors.titles.validation' => 'Validatiefout',
			'errors.titles.unknown' => 'Fout',
			'errors.messages.network' => 'Geen internetverbinding',
			'errors.messages.timeout' => 'Verzoek duurde te lang',
			'errors.messages.sessionExpired' => 'Je sessie is verlopen. Log opnieuw in.',
			'errors.messages.unauthorized' => 'Je hebt geen toestemming om dit te openen.',
			'errors.messages.invalidCredentials' => 'Ongeldig e-mailadres of wachtwoord.',
			'errors.messages.fileNotFound' => 'Bestand niet gevonden',
			'errors.messages.fileTooLarge' => 'Bestand is te groot',
			'errors.messages.invalidFileType' => 'Ongeldig bestandstype',
			'errors.messages.permissionDenied' => 'Je hebt geen toestemming gegeven om foto\'s te gebruiken.',
			'errors.messages.permissionPermanentlyDenied' => 'Ga naar Instellingen om toegang tot foto\'s te geven.',
			'errors.messages.serverError' => 'Er is iets misgegaan. Probeer het later opnieuw.',
			'errors.messages.rateLimitExceeded' => 'Te veel verzoeken. Wacht even.',
			'errors.messages.notFound' => 'Bron niet gevonden',
			'errors.messages.validationWithField' => ({required Object field, required Object reason}) => 'Ongeldig ${field}: ${reason}',
			'errors.messages.unknown' => 'Er is een onverwachte fout opgetreden.',
			'errors.actions.goToSettings' => 'Naar Instellingen',
			'profile.title' => 'Profiel',
			'profile.settings' => 'Instellingen',
			'profile.myReservations' => 'Mijn Reserveringen',
			'profile.memberSince' => ({required Object year}) => 'Lid sinds ${year}',
			'profile.myReservationsNrThisMonth' => ({required Object reservationsThisMonth}) => 'Mijn reserveringen deze maand ${reservationsThisMonth}',
			'profile.logout' => 'Uitloggen',
			'profile.logoutDialog.title' => 'Uitloggen',
			'profile.logoutDialog.message' => 'Weet je zeker dat je wilt uitloggen?',
			'profile.logoutDialog.confirm' => 'Uitloggen',
			'profile.logoutDialog.cancel' => 'Annuleren',
			'settings.title' => 'Instellingen',
			'settings.language.title' => 'Taal',
			'settings.language.dutch' => 'Nederlands',
			'settings.language.english' => 'English',
			'settings.language.arabic' => 'العربية',
			'settings.theme.title' => 'Weergave',
			'settings.theme.light' => 'Licht',
			'settings.theme.lightDesc' => 'Altijd lichte modus',
			'settings.theme.system' => 'Systeem',
			'settings.theme.systemDesc' => 'Volg iPhone/iPad instelling',
			'settings.theme.dark' => 'Donker',
			'settings.theme.darkDesc' => 'Altijd donkere modus',
			'news.empty' => 'Geen nieuws beschikbaar',
			'news.title' => 'Nieuws',
			'auth.login' => 'Inloggen',
			'auth.logout' => 'Uitloggen',
			'auth.email' => 'E-mailadres',
			'auth.password' => 'Wachtwoord',
			'auth.notLoggedIn' => 'Niet ingelogd',
			'auth.registerHere' => 'Registreer hier',
			_ => null,
		};
	}
}
