import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/models/app_error.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/services/auth_service.dart';
import 'package:mandi/core/services/dialog_service.dart';
import 'package:mandi/core/services/error_display_service.dart';
import 'package:mandi/core/services/image_service.dart';
import 'package:mandi/core/services/user_repository.dart';
import 'package:mandi/core/services/user_service.dart';
import 'package:mandi/core/utils/error_handler.dart';
import 'package:mandi/core/utils/logger.dart';
import 'package:mandi/core/viewmodels/base_view_model.dart';

enum DeletionStep {
  idle,
  removingAvatar,
  deletingData,
  schedulingDeletion,
  completed,
}

class AuthViewModel extends BaseViewModel {
  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();
  final DialogService _dialogService = locator<DialogService>();
  final ErrorDisplayService _errorDisplayService = locator<ErrorDisplayService>();
  final ImageService _imageService = locator<ImageService>();
  final UserRepository _userRepository = locator<UserRepository>();

  ValueListenable<User?> get currentUser => _userService.currentUser;
  ValueListenable<bool> get isLoggedIn => _authService.isAuthenticated;

  final ValueNotifier<DeletionStep> deletionStepNotifier = ValueNotifier(DeletionStep.idle);

  final ValueNotifier<bool> _userIsMarkedForDeletion = ValueNotifier(false);
  ValueListenable<bool> get userIsMarkedForDeletion => _userIsMarkedForDeletion;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  AuthViewModel();

  Future<bool> startAccountDeletion() async {
    Logger.log(runtimeType.toString(), '🚀 Starting account deletion flow...');

    setBusy(true);
    clearError();

    try {
      // Step 1: Avatar
      deletionStepNotifier.value = DeletionStep.removingAvatar;
      Logger.log(runtimeType.toString(), '📸 Scheduling removing of your images...');
      await deleteAvatar();

      // Step 2: Database
      deletionStepNotifier.value = DeletionStep.deletingData;
      Logger.log(runtimeType.toString(), '💾 Soft deleting user data...');
      await softDeleteUserData();

      // Step 3: Account
      deletionStepNotifier.value = DeletionStep.schedulingDeletion;
      Logger.log(runtimeType.toString(), '🔐 Scheduling account deletion...');
      // Set time for animation to complete
      await Future.delayed(const Duration(milliseconds: 500));

      // Completed state
      deletionStepNotifier.value = DeletionStep.completed;
      Logger.success(runtimeType.toString(), '🎉 Account successfully marked for deletion!');

      // Wait 5 seconds for the user to see that process is complete
      await Future.delayed(const Duration(seconds: 5));

      return true;
    } catch (e) {
      Logger.error(runtimeType.toString(), '❌ Deletion failed: $e');
      setError('Account deletion failed: $e');
      deletionStepNotifier.value = DeletionStep.idle;
      return false;
    } finally {
      setBusy(false);
    }
  }

  Future<void> checkIfUserIsMarkedForDeletion() async {
    try {
      String? user = currentUser.value?.id;
      if (user != null) {
        _userIsMarkedForDeletion.value = await _userRepository.checkIfUserIsMarkedForDeletion(user);
      } else {
        Logger.info(runtimeType.toString(), '🔎 Could not find the user id: $user');
        _userIsMarkedForDeletion.value = false;
      }
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Checking for marked deletion failed: $e');
      _userIsMarkedForDeletion.value = false;
    }
  }

  Future<void> cancelAccountDeletion() async {
    final String? user = currentUser.value?.id;
    if (user != null) {
      try {
        Logger.info(runtimeType.toString(), 'Cancelling account deletion');
        await _userRepository.cancelDeletionOfAccount(user);
        Logger.info(runtimeType.toString(), 'Scheduled user deletion reverted');
        _userIsMarkedForDeletion.value = false;
      } catch (e, stackTrace) {
        Logger.error(runtimeType.toString(),
            'Something went wrong when cancelling the deletion of user: $user');
        final error = ErrorHandler.handleException(e, stackTrace);
        _errorDisplayService.showError(error);
        _userIsMarkedForDeletion.value = true;
      }
    } else {
      Logger.info(runtimeType.toString(), 'User ID invalid: $user');
      _errorDisplayService.showError(AppError.unknown());
      _userIsMarkedForDeletion.value = true;
    }
  }

  Future<void> loginWithCredentials() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty) {
      setError('Vul je email in');
      return;
    }

    if (password.isEmpty) {
      setError('Vul je wachtwoord in');
      return;
    }

    if (!email.contains('@')) {
      setError('Ongeldig emailadres');
      return;
    }

    setBusy(true);
    clearError();

    try {
      await _authService.login(email, password);
    } catch (e) {
      setError('Login mislukt: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }

  Future<void> logout() async {
    setBusy(true);
    clearError();

    try {
      await _authService.logout();
    } catch (e) {
      setError('Logout mislukt: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }

  Future<void> createAccount() async {
    if (nameController.text.isEmpty) {
      setError('Enter your name');
      return;
    }

    if (emailController.text.isEmpty) {
      setError('Enter your email');
      return;
    }

    if (passwordController.text.isEmpty) {
      setError('Enter your password');
      return;
    }

    if (!emailController.text.contains('@')) {
      setError('Invalid email address');
      return;
    }

    setBusy(true);
    clearError();

    try {
      await _authService.register(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        fullName: nameController.text.trim(),
      );
    } catch (e) {
      setError('Account creation failed: ${e.toString()}');
    } finally {
      setBusy(false);
    }
  }

  Future<bool> requestAccountDeletion() async {
    try {
      Logger.log(runtimeType.toString(), 'Deletion of account requested');
      final deletionConfirmed = await _dialogService.showDeleteAccountConfirmation();
      _userIsMarkedForDeletion.value = true;
      return deletionConfirmed;
    } on Exception catch (e, stackTrace) {
      Logger.error(runtimeType.toString(), 'Something went wrong: $e');
      final error = ErrorHandler.handleException(e, stackTrace);
      _errorDisplayService.showError(error);
      return false;
    }
  }

  Future<void> deleteAvatar() async {
    final userId = currentUser.value?.id;
    if (userId == null) {
      Logger.error(runtimeType.toString(), 'Skipping avatar deletion - no user ID');
      return;
    }

    Logger.log(runtimeType.toString(), 'Deleting avatar...');
    await _imageService.deleteAvatar(userId);
    Logger.log(runtimeType.toString(), 'Avatar deleted');
  }

  Future<void> softDeleteUserData() async {
    final userId = currentUser.value?.id;
    if (userId == null) {
      Logger.info(runtimeType.toString(), 'Skipping soft delete - no user ID');
      return;
    }

    try {
      Logger.log(runtimeType.toString(), 'Marking user for deletion...');
      await _userRepository.markAccountForDeletion(userId: userId);
      Logger.log(runtimeType.toString(), 'User marked for deletion');
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Failed to mark user for deletion: $e');
      rethrow;
    }
  }

  @override
  void dispose() {
    deletionStepNotifier.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
