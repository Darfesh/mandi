import 'dart:io';
import 'package:dart_appwrite/dart_appwrite.dart';

Future<dynamic> main(final context) async {
  context.log('Starting account cleanup...');

  final client = Client()
      .setEndpoint(
          Platform.environment['APPWRITE_ENDPOINT'] ?? 'http://localhost:3002/v1')
      .setProject(Platform.environment['APPWRITE_PROJECT_ID']!)
      .setKey(Platform.environment['APPWRITE_API_KEY']!);

  final databases = Databases(client);
  final storage = Storage(client);
  final users = Users(client);

  final databaseId = Platform.environment['APPWRITE_DATABASE_ID']!;
  final bucketId = Platform.environment['APPWRITE_BUCKET_ID']!;
  final cutoff = DateTime.now().subtract(const Duration(days: 30));

  context.log('Fetching users pending deletion before $cutoff...');

  final results = await databases.listDocuments(
    databaseId: databaseId,
    collectionId: 'users',
    queries: [
      Query.equal('status', 'pendingDeletion'),
      Query.lessThan(
          'accountMarkedForDeletionDate', cutoff.toIso8601String()),
      Query.limit(100),
    ],
  );

  int deleted = 0;
  int failed = 0;

  for (final doc in results.documents) {
    final userId = doc.data['userId'] as String?;
    if (userId == null) {
      context.error('Document ${doc.$id} has no userId, skipping');
      failed++;
      continue;
    }

    try {
      context.log('Processing user: $userId');

      // 1. Delete avatar from storage
      try {
        await storage.deleteFile(bucketId: bucketId, fileId: 'avatar_$userId');
        context.log('Avatar deleted for $userId');
      } on AppwriteException catch (e) {
        if (e.code != 404) rethrow;
      }

      // 2. Delete user document from users collection
      await databases.deleteDocument(
        databaseId: databaseId,
        collectionId: 'users',
        documentId: doc.$id,
      );

      // 3. Delete Appwrite Auth user
      await users.delete(userId: userId);

      deleted++;
      context.log('Successfully deleted user: $userId');
    } catch (e) {
      failed++;
      context.error('Failed to delete user $userId: $e');
    }
  }

  final message = 'Cleanup complete: $deleted deleted, $failed failed';
  context.log(message);

  return context.res.json({
    'success': true,
    'deleted': deleted,
    'failed': failed,
  });
}
