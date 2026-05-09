import 'package:mandi/core/locator.dart';
import 'package:mandi/core/models/app_error.dart';
import 'package:mandi/core/services/analytics_service.dart';
import 'package:mandi/core/services/banner_service.dart';
import 'package:mandi/core/services/dialog_service.dart';
import 'package:permission_handler/permission_handler.dart' as ph;

import 'package:mandi/i18n/strings.g.dart';

class ErrorDisplayService {
  final BannerService _bannerService;
  final DialogService _dialogService;

  ErrorDisplayService(this._bannerService, this._dialogService);

  String _getMessage(AppError error, Translations t) {
    switch (error.type) {
      case ErrorType.network:
        return t.errors.messages.network;
      case ErrorType.timeout:
        return t.errors.messages.timeout;
      case ErrorType.sessionExpired:
        return t.errors.messages.sessionExpired;
      case ErrorType.unauthorized:
        return t.errors.messages.unauthorized;
      case ErrorType.invalidCredentials:
        return t.errors.messages.invalidCredentials;
      case ErrorType.fileNotFound:
        return t.errors.messages.fileNotFound;
      case ErrorType.fileTooLarge:
        return t.errors.messages.fileTooLarge;
      case ErrorType.invalidFileType:
        return t.errors.messages.invalidFileType;
      case ErrorType.permissionDenied:
        return t.errors.messages.permissionDenied;
      case ErrorType.permissionPermanentlyDenied:
        return t.errors.messages.permissionPermanentlyDenied;
      case ErrorType.serverError:
        return t.errors.messages.serverError;
      case ErrorType.rateLimitExceeded:
        return t.errors.messages.rateLimitExceeded;
      case ErrorType.notFound:
        return t.errors.messages.notFound;
      case ErrorType.validation:
        return error.technicalDetails ?? t.errors.messages.unknown;
      case ErrorType.unknown:
        return t.errors.messages.unknown;
    }
  }

  Future<void> showError(AppError error) async {
    locator<AnalyticsService>().trackException(error);

    final context = _dialogService.context; 
    if (context == null) return;

    final t = Translations.of(context);
    final message = _getMessage(error, t);
    final title = _getTitle(error.type, t);

    switch (error.type) {
      // Blocking
      case ErrorType.sessionExpired:
        await _dialogService.showError(
          title: title,
          message: message,
        );
        break;

      case ErrorType.unauthorized:
        await _dialogService.showError(
          title: title,
          message: message,
        );
        break;

      // Prominent
      case ErrorType.invalidCredentials:
      case ErrorType.serverError:
      case ErrorType.fileTooLarge:
      case ErrorType.fileNotFound:
      case ErrorType.rateLimitExceeded:
      case ErrorType.unknown:
        _bannerService.showError(
          title: title,
          message: message,
        );
        break;

      // Subtle
      case ErrorType.network:
      case ErrorType.timeout:
      case ErrorType.validation:
      case ErrorType.invalidFileType:
      case ErrorType.notFound:
        _bannerService.showSnackbar(
          message: message,
        );
        break;

      case ErrorType.permissionDenied:
      case ErrorType.permissionPermanentlyDenied:
        final shouldOpenSettings = await _dialogService.showErrorWithAction(
          title: title,
          message: message,
          actionText: t.errors.actions.goToSettings,
        );

        if (shouldOpenSettings) {
          await ph.openAppSettings();
        }
        break;
    }
  }

  String _getTitle(ErrorType type, Translations t) {
    switch (type) {
      case ErrorType.invalidCredentials:
        return t.errors.titles.invalidCredentials;
      case ErrorType.serverError:
        return t.errors.titles.serverError;
      case ErrorType.fileTooLarge:
        return t.errors.titles.fileTooLarge;
      case ErrorType.fileNotFound:
        return t.errors.titles.fileNotFound;
      case ErrorType.rateLimitExceeded:
        return t.errors.titles.rateLimitExceeded;
      case ErrorType.network:
        return t.errors.titles.network;
      case ErrorType.timeout:
        return t.errors.titles.timeout;
      case ErrorType.sessionExpired:
        return t.errors.titles.sessionExpired;
      case ErrorType.unauthorized:
        return t.errors.titles.unauthorized;
      case ErrorType.validation:
        return t.errors.titles.validation;
      case ErrorType.invalidFileType:
        return t.errors.titles.invalidFileType;
      case ErrorType.notFound:
        return t.errors.titles.notFound;
      case ErrorType.unknown:
        return t.errors.titles.unknown;
      case ErrorType.permissionDenied:
      case ErrorType.permissionPermanentlyDenied:
        return t.errors.titles.permissionPermanentlyDenied;
    }
  }
}
