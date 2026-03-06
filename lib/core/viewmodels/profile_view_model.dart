import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandi/core/services/dialog_service.dart';
import 'package:mandi/core/services/error_display_service.dart';
import 'package:mandi/core/services/image_service.dart';
import 'package:mandi/core/services/user_service.dart';
import 'package:mandi/core/utils/error_handler.dart';
import 'package:mandi/core/viewmodels/base_view_model.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/utils/logger.dart';

class ProfileViewModel extends BaseViewModel {
  final AuthViewModel _authViewModel = locator<AuthViewModel>();
  final DialogService _dialogService = locator<DialogService>();
  final UserService _userService = locator<UserService>();
  final ImageService _imageService = locator<ImageService>();
  final ErrorDisplayService _errorDisplayService = locator<ErrorDisplayService>();

  ProfileViewModel() {
    Logger.init(runtimeType.toString());
  }

  ValueListenable<User?> get currentUser => _userService.currentUser;

  Future<void> logout() async {
    try {
      final confirmed = await _dialogService.showLogoutConfirmation();

      if (!confirmed) return;

      Logger.info(runtimeType.toString(), 'Logout initiated');
      await _authViewModel.logout();
      Logger.success(runtimeType.toString(), 'Logout successful');
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Logout failed: $e');
      rethrow;
    }
  }

  Future<void> updateAvatar() async {
    try {
      Logger.info(runtimeType.toString(), 'Avatar update initiated');

      final avatarUrl = await _imageService.pickAndUploadAvatar(
        source: ImageSource.gallery,
      );

      if (avatarUrl == null) {
        Logger.info(runtimeType.toString(), 'Avatar update canceled by user');
        return;
      }

      await _userService.updateAvatar(avatarUrl);

      Logger.success(runtimeType.toString(), 'Avatar updated successfully');
    } on Exception catch (e, stackTrace) {
      Logger.error(runtimeType.toString(), 'Avatar update failed: $e');
      final error = ErrorHandler.handleException(e, stackTrace);
      _errorDisplayService.showError(error);
    }
  }

  Future<void> openPrivacyPolicy(BuildContext context) async {
    try {
      Logger.info(runtimeType.toString(), 'Opening privacy policy');
      context.push('/privacyPolicyView');
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Failed to open privacy policy: $e');
    }
  }

  @override
  void dispose() {
    Logger.disposed(runtimeType.toString());
    super.dispose();
  }
}
