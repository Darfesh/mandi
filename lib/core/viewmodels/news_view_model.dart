import 'package:flutter/foundation.dart';
import 'package:mandi/core/models/news_dto.dart';
import 'package:mandi/core/services/news_service.dart';
import 'package:mandi/core/utils/logger.dart';
import 'package:mandi/core/viewmodels/base_view_model.dart';

class NewsViewModel extends BaseViewModel {
  final NewsService _newsService;
  NewsViewModel({required NewsService newsService})
      : _newsService = newsService;

  final ValueNotifier<List<NewsDto>> _newsPosts = ValueNotifier([]);
  ValueListenable<List<NewsDto>> get newsPosts => _newsPosts;
  
  Future<void> getAllNewsPosts() async {
    try {
      setBusy(true);
      _newsPosts.value = await _newsService.getAllPosts();
    } catch (e) {
      Logger.error(
          runtimeType.toString(), 'Failed to get posts from server: $e');
      setError(e.toString());
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    _newsPosts.dispose();
    super.dispose();
  }
}
