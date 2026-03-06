// lib/core/services/user_service.dart

import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:mandi/core/constants/appwrite_collections.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/services/realtime_service.dart';
import 'package:mandi/core/services/client_service.dart';
import 'package:mandi/core/utils/logger.dart';

class UserService {
  final RealtimeService _realtimeService;
  final ClientService _clientService;
  late final Account _account;

  UserService({
    required RealtimeService realtimeService,
    required ClientService clientService,
  })  : _realtimeService = realtimeService,
        _clientService = clientService {
    Logger.init(runtimeType.toString());
    _account = _clientService.account;
    _subscribeToAccountUpdates();
  }

  final ValueNotifier<User?> _currentUser = ValueNotifier(null);
  ValueListenable<User?> get currentUser => _currentUser;

  String? get userId => _currentUser.value?.id;
  String? get userEmail => _currentUser.value?.email;
  String? get userName => _currentUser.value?.fullName;

  Future<void> fetchCurrentUser() async {
    await _fetchAndSetUser();
  }

  Future<void> refreshUserData() async {
    await _fetchAndSetUser();
  }

  // ✅ Shared logic!
  Future<void> _fetchAndSetUser() async {
    final x = userId;
    if (x == null) return;
    try {
      Logger.info(runtimeType.toString(), 'Fetching user data...');

      final appwriteUser = await _account.get();
      final databases = Databases(_clientService.client);

      // Check if user document exists
      final docs = await databases.listDocuments(
        databaseId: Environment.databaseId,
        collectionId: AppwriteCollections.users,
        queries: [
          Query.equal('userId', appwriteUser.$id),
        ],
      );

      if (docs.documents.isEmpty) {
        // Create document
        Logger.info(runtimeType.toString(), '📝 Creating user document...');

        await databases.createDocument(
          databaseId: Environment.databaseId,
          collectionId: AppwriteCollections.users,
          documentId: ID.unique(),
          data: {
            'userId': appwriteUser.$id,
            'email': appwriteUser.email,
            'fullName': appwriteUser.name.split(' ').first,
            'avatarUrl': null,
            'status': Role.user(x),
          },
          permissions: [
            Permission.read(Role.any()),
            Permission.update(Role.user(appwriteUser.$id)),
            Permission.delete(Role.user(appwriteUser.$id)),
          ],
        );

        Logger.success(runtimeType.toString(), '✅ User document created!');
      }

      // Fetch document (now guaranteed to exist)
      final updatedDocs = await databases.listDocuments(
        databaseId: Environment.databaseId,
        collectionId: AppwriteCollections.users,
        queries: [
          Query.equal('userId', appwriteUser.$id),
        ],
      );

      final user = User.fromDocument(updatedDocs.documents.first.data);
      _currentUser.value = user;

      Logger.success(runtimeType.toString(), '✅ User loaded: ${user.email}');
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Failed to fetch user: $e');
      _currentUser.value = null;
      rethrow;
    }
  }

  Future<void> updateAvatar(String avatarUrl) async {
    try {
      if (_currentUser.value?.id == null) {
        throw Exception('No user logged in');
      }

      final databases = Databases(_clientService.client);

      // 1. Find document by userId
      final docs = await databases.listDocuments(
        databaseId: Environment.databaseId,
        collectionId: AppwriteCollections.users,
        queries: [
          Query.equal('userId', _currentUser.value!.id),
        ],
      );

      // 2. Check if document exists
      if (docs.documents.isEmpty) {
        throw Exception('User document not found');
      }

      // 3. Get document ID
      final documentId = docs.documents.first.$id;

      Logger.info(runtimeType.toString(), 'Updating document: $documentId');

      // 4. Update document
      final updatedDoc = await databases.updateDocument(
        databaseId: Environment.databaseId,
        collectionId: AppwriteCollections.users,
        documentId: documentId,
        data: {
          'avatarUrl': avatarUrl,
        },
      );

      final updatedUser = User.fromDocument(updatedDoc.data);

      _currentUser.value = updatedUser;

      Logger.success(runtimeType.toString(), '✅ Avatar updated!');
    } catch (e) {
      Logger.error(runtimeType.toString(), '❌ Error updating avatar: $e');
      rethrow;
    }
  }

  void clearUser() {
    Logger.info(runtimeType.toString(), 'Clearing user data');
    _currentUser.value = null;
  }

  void _subscribeToAccountUpdates() {
    Logger.info(runtimeType.toString(), '📡 Subscribing to account updates');

    _realtimeService.subscribe('account').listen((event) {
      Logger.log(runtimeType.toString(), '📨 Event: ${event.events}');

      if (event.events.any((e) => e.contains('account') && e.contains('update'))) {
        Logger.info(runtimeType.toString(), '🔄 Account updated remotely');
        refreshUserData();
      }

      if (event.events
          .any((e) => e.contains('account') && e.contains('delete') && !e.contains('session'))) {
        Logger.info(runtimeType.toString(), '🗑️ Account deleted remotely');
        clearUser();
      }
    });
  }
}
