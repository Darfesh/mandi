import 'package:flutter/material.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/models/news_dto.dart';
import 'package:mandi/ui/widgets/news/news_card_border.dart';
import 'package:mandi/ui/widgets/news/news_card_content.dart';

class NewsCard extends StatelessWidget {
  final NewsDto newsItem;

  const NewsCard({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Environment.size16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 1,
        shadowColor: Colors.white,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Environment.size12),
          ),
          side: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
        child: Stack(
          children: [
            NewsCardContent(newsItem: newsItem),
            const NewsCardBorder(),
          ],
        ),
      ),
    );
  }
}
