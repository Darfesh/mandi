import 'dart:async';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:mandi/core/constants/appwrite_collections.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/constants/realtime_channels.dart';
import 'package:mandi/core/services/client_service.dart';
import 'package:mandi/core/services/realtime_service.dart';
import 'package:mandi/core/services/user_service.dart';
import 'package:mandi/core/utils/logger.dart';

class AuthService {
  final ClientService _clientService;
  final RealtimeService _realtimeService;
  final UserService _userService;

  late final Account _account;

  final ValueNotifier<bool> _isAuthenticated = ValueNotifier(false);
  ValueListenable<bool> get isAuthenticated => _isAuthenticated;

  bool get isLoggedIn => _isAuthenticated.value;

  String? get currentUserId => _userService.userId;

  StreamSubscription<RealtimeMessage>? _sessionEventsSubscription;

  AuthService({
    required ClientService clientService,
    required RealtimeService realtimeService,
    required UserService userService,
  })  : _clientService = clientService,
        _realtimeService = realtimeService,
        _userService = userService {
    Logger.init(runtimeType.toString());
    _account = _clientService.account;
    _checkCurrentSession();
    _subscribeToSessionEvents();
  }

  Future<void> _checkCurrentSession() async {
    try {
      await _account.get();
      _isAuthenticated.value = true;
      await _userService.fetchCurrentUser();
      Logger.info(runtimeType.toString(), '✅ Session found');
    } catch (e) {
      _isAuthenticated.value = false;
      Logger.info(runtimeType.toString(), '❌ No active session');
    }
  }

  Future<void> login(String email, String password) async {
    Logger.log(runtimeType.toString(), '📧 LOGIN attempt for: $email');
    email = email.trim();
    password = password.trim();

    try {
      await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      _isAuthenticated.value = true;
      await _userService.fetchCurrentUser();

      Logger.success(runtimeType.toString(), '✅ LOGIN success');
    } catch (e) {
      _isAuthenticated.value = false;
      Logger.error(runtimeType.toString(), '❌ LOGIN failed: $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    Logger.log(runtimeType.toString(), '🚪 LOGOUT attempt');
    try {
      await _account.deleteSession(sessionId: 'current');
      _isAuthenticated.value = false;
      _userService.clearUser();
      Logger.success(runtimeType.toString(), '✅ LOGOUT success');
    } catch (e) {
      Logger.error(runtimeType.toString(), '❌ LOGOUT failed: $e');
      rethrow;
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    Logger.log(runtimeType.toString(), '📝 REGISTER attempt');

    try {
      final authUser = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: fullName,
      );

      Logger.log(runtimeType.toString(), '✅ Auth account created');

      await _createUserDocument(authUser);

      Logger.log(runtimeType.toString(), '✅ User document created, logging in...');

      await login(email, password);
    } catch (e) {
      Logger.error(runtimeType.toString(), '❌ REGISTER failed: $e');
      rethrow;
    }
  }

  Future<void> _createUserDocument(dynamic authUser) async {
    try {
      final databases = Databases(_clientService.client);

      await databases.createDocument(
        databaseId: Environment.databaseId,
        collectionId: AppwriteCollections.users,
        documentId: ID.unique(),
        data: {
          'userId': authUser.$id,
          'email': authUser.email,
          'fullName': authUser.name,
          'avatarUrl': null,
        },
      );

      Logger.success(runtimeType.toString(), '✅ User document created');
    } catch (e) {
      Logger.error(runtimeType.toString(), '❌ Failed to create user document: $e');
      await _account.deleteIdentity(identityId: authUser.$id);
      rethrow;
    }
  }

  void _subscribeToSessionEvents() {
    Logger.info(runtimeType.toString(), '📡 Subscribing to account events');
    _sessionEventsSubscription =
        _realtimeService.subscribe(RealtimeChannels.account).listen((event) {
      Logger.log(runtimeType.toString(), '📨 Realtime: ${event.events}');

      if (event.events.any((e) => e.contains('session') && e.contains('delete'))) {
        Logger.info(runtimeType.toString(), '🔴 Session deleted remotely');
        _handleRemoteLogout();
      }

      if (event.events.any((e) => e.contains('account') || e.contains('users'))) {
        Logger.info(runtimeType.toString(), '🗑️ Account deleted remotely');
        _handleRemoteLogout();
      }
    });
  }


  void _handleRemoteLogout() {
    _isAuthenticated.value = false;
    _userService.clearUser();
    Logger.info(runtimeType.toString(), '🚪 Remote logout handled');
  }

  void dispose() {
    _sessionEventsSubscription?.cancel();
    _isAuthenticated.dispose();
    Logger.disposed(runtimeType.toString());
  }
}
