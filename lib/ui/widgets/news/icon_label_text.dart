import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mandi/core/constants/environment.dart';

class IconLabelText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconLabelText({
    super.key,
    required this.icon,
    required this.text,
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
        Expanded(
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelSmall,
            text,
          ),
        ),
      ],
    );
  }
}
