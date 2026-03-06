import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:mandi/core/constants/appwrite_collections.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/utils/logger.dart';

class UserRepository {
  final Databases _databases;

  UserRepository({
    required Databases databases,
  }) : _databases = databases {
    Logger.init(runtimeType.toString());
  }

  /// Get user document by userId field (not document ID)
  Future<Document?> getUserDocument({required String userId}) async {
    try {
      final documentList = await _databases.listDocuments(
        databaseId: Environment.databaseId,
        collectionId: AppwriteCollections.users,
        queries: [
          Query.equal('userId', userId),
          Query.limit(1),
        ],
      );

      if (documentList.documents.isEmpty) {
        Logger.error(runtimeType.toString(), 'No user found with userId: $userId');
        return null;
      }

      return documentList.documents.first;
    } on AppwriteException catch (e) {
      Logger.error(runtimeType.toString(), 'Appwrite error getting user: ${e.message}');
      rethrow;
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Error getting user document: $e');
      rethrow;
    }
  }

  /// Mark user account for deletion (soft delete)
  Future<void> markAccountForDeletion({required String userId}) async {
    try {
      final document = await getUserDocument(userId: userId);

      if (document == null) {
        throw Exception('Cannot mark account for deletion: User not found ($userId)');
      }

      await _updateDocument(
        documentId: document.$id,
        data: {
          'status': 'pendingDeletion',
          'accountMarkedForDeletionDate': DateTime.now().toIso8601String(),
        },
      );

      Logger.log(runtimeType.toString(), 'Account marked for deletion: $userId');
    } on AppwriteException catch (e) {
      Logger.error(
        runtimeType.toString(),
        'Appwrite error marking account for deletion: ${e.message}',
      );
      rethrow;
    } catch (e) {
      Logger.error(
        runtimeType.toString(),
        'Error marking account for deletion ($userId): $e',
      );
      rethrow;
    }
  }

  Future<bool> checkIfUserIsMarkedForDeletion(String userId) async {
    final DocumentList documentList;
    documentList = await _databases.listDocuments(
        databaseId: Environment.databaseId,
        collectionId: AppwriteCollections.users,
        queries: [
          Query.contains('id', userId),
          Query.contains('status', 'pendingDeletion'),
          Query.limit(1),
        ]);

    return documentList.documents.isNotEmpty ? true : false;
  }

  Future<void> cancelDeletionOfAccount(String userId) async {
    try {
      final userDocument = await getUserDocument(userId: userId);
      if (userDocument == null) {
        Logger.info(runtimeType.toString(), 'User record is not marked for deletion');
      } else {
        await _updateDocument(documentId: userDocument.$id, data: {
          'status': 'active',
          'accountMarkedForDeletionDate': null,
        });
      }
    } catch (e) {
      Logger.error(runtimeType.toString(),
          'Something went wrong with cancelling the deletion of user: $userId');
      rethrow;
    }
  }

  // Private helper - no error handling, let caller handle it
  Future<void> _updateDocument({
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await _databases.updateDocument(
      databaseId: Environment.databaseId,
      collectionId: AppwriteCollections.users,
      documentId: documentId,
      data: data,
    );
  }
}
