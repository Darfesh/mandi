import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mandi/core/constants/environment.dart';

class IconLabelDate extends StatelessWidget {
  final IconData icon;
  final DateTime date;

  const IconLabelDate({
    super.key,
    required this.icon,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: theme.colorScheme.secondary,
        ),
        const Gap(Environment.size8),
        Text(
          maxLines: 1,
          style: theme.textTheme.labelSmall,
          DateFormat('d MMMM yyyy', 'nl_NL').format(date),
        ),
      ],
    );
  }
}
