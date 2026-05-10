import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/models/news_dto.dart';
import 'package:mandi/ui/widgets/news/news_label_row.dart';

class NewsCardContent extends StatelessWidget {
  final NewsDto newsItem;

  const NewsCardContent({
    super.key,
    required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    final newsItem = this.newsItem;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: newsItem.imageUrl != null
              ? Image.network(
                  newsItem.imageUrl!,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                  errorBuilder: (_, __, ___) => Image.asset(
                    'assets/images/darfesh.png',
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                  ),
                )
              : Image.asset(
                  'assets/images/darfesh.png',
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(Environment.size8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                maxLines: 2,
                style: Theme.of(context).textTheme.titleLarge,
                newsItem.title,
              ),
              const Gap(Environment.size16),
              Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
                newsItem.content,
              ),
              const Gap(Environment.size16),
              // Label Row
              NewsLabelRow(
                authorName: newsItem.authorName,
                publishedAt: newsItem.createdAt,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
