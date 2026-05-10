import 'package:appwrite/appwrite.dart';
import 'package:mandi/core/constants/appwrite_collections.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/models/news_dto.dart';
import 'package:mandi/core/utils/logger.dart';

class NewsService {
  final Databases _databases;
  NewsService({required Databases databases}) : _databases = databases {
    Logger.init(runtimeType.toString());
  }

  Future<List<NewsDto>> getAllPosts() async {
    try {
      final documentList = await _databases.listDocuments(
          databaseId: Environment.databaseId,
          collectionId: AppwriteCollections.news_articles,
          queries: [Query.limit(20)]);

      //For future pagination use appwrite cursor pagination: https://appwrite.io/docs/products/databases/pagination

      if (documentList.documents.isEmpty) {
        Logger.info(runtimeType.toString(), 'No news posts found');
        return [];
      }

      return documentList.documents
          .map((doc) => NewsDto.fromDocument(doc))
          .toList();
    } on AppwriteException catch (e) {
      Logger.error(runtimeType.toString(),
          'Appwrite error getting the news posts: ${e.message}');
      rethrow;
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Error news posts: $e');
      rethrow;
    }
  }
}
