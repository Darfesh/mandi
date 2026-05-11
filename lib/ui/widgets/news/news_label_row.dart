import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/ui/widgets/news/icon_label_date.dart';
import 'package:mandi/ui/widgets/news/icon_label_text.dart';

class NewsLabelRow extends StatelessWidget {
  final String authorName;
  final DateTime publishedAt;

  const NewsLabelRow({
    super.key,
    required this.authorName,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: IconLabelText(
            icon: Icons.person_outline,
            text: authorName,
          ),
        ),
        const Gap(Environment.size16),
        IconLabelDate(
          icon: Icons.schedule_outlined,
          date: publishedAt,
        ),
      ],
    );
  }
}
