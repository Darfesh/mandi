import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/ui/widgets/common/base_action_card.dart';

class ActionTile extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String label;
  final String? subtitle;
  final VoidCallback onTap;
  final bool showChevron;
  final bool isDanger;
  final bool centerContent;
  final Color? backgroundColor;
  final Color? textColor;

  const ActionTile({
    super.key,
    this.icon,
    this.iconColor,
    required this.label,
    this.subtitle,
    required this.onTap,
    this.showChevron = true,
    this.isDanger = false,
    this.centerContent = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const dangerColor = Color(0xFFef4444);

    final themeIconColor = isDanger ? dangerColor : theme.iconTheme.color;
    final themeTextColor = isDanger ? dangerColor : theme.textTheme.titleMedium?.color;

    return BaseActionCard(
      onTap: onTap,
      isDanger: isDanger,
      backgroundColor: backgroundColor,
      child: Row(
        mainAxisAlignment: centerContent ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: iconColor ?? themeIconColor,
              size: Environment.size24,
            ),
            const Gap(Environment.size16),
          ],
          if (centerContent)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: textColor ?? themeTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (subtitle != null) ...[
                  const Gap(4),
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ],
            )
          else
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const Gap(4),
                    Text(
                      subtitle!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          if (showChevron && !centerContent)
            Icon(
              Icons.arrow_forward_ios,
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
              size: Environment.size16,
            ),
        ],
      ),
    );
  }
}
