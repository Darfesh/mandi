import 'package:flutter/material.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/i18n/strings.g.dart';
import 'package:mandi/ui/settings/delete_account_dialog.dart';

class DialogService {
  final GlobalKey<NavigatorState> _navigatorKey = locator<GlobalKey<NavigatorState>>();

  BuildContext? get _context => _navigatorKey.currentContext;
  BuildContext? get context => _context;

  Translations? get _translations {
    final context = _context;
    return context != null ? Translations.of(context) : null;
  }

  Translations? get translations => _translations;

  Future<bool> showConfirmation({
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
  }) async {
    final context = _context;
    if (context == null) return false;

    final t = _translations;
    if (t == null) return false;

    final theme = Theme.of(context);

    final dialogBackgroundColor = theme.dialogBackgroundColor;
    final titleColor = theme.colorScheme.onSurface;
    final contentColor = theme.colorScheme.onSurfaceVariant;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: dialogBackgroundColor,
        title: Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: titleColor,
          ),
        ),
        content: Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: contentColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText ?? t.dialog.confirmation.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmText ?? t.dialog.confirmation.confirm),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  Future<bool> showDeleteAccountConfirmation() async {
    final context = _context;
    if (context == null) return false;

    final t = _translations;
    if (t == null) return false;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => DeleteAccountDialog(
        title: 'Account deletion',
        message: 'You\'re about the delete your account! \n Type delete to confirm this.',
      ),
    );

    return result ?? false;
  }


  Future<bool> showLogoutConfirmation() async {
    final t = _translations;
    if (t == null) return false;

    return showConfirmation(
      title: t.profile.logoutDialog.title,
      message: t.profile.logoutDialog.message,
      confirmText: t.profile.logoutDialog.confirm,
      cancelText: t.profile.logoutDialog.cancel,
    );
  }

  Future<void> showError({
    required String title,
    required String message,
    String? details,
  }) async {
    final context = _context;
    if (context == null) return;

    final t = _translations;
    if (t == null) return;

    final theme = Theme.of(context);

    final dialogBackgroundColor = theme.dialogBackgroundColor;
    final titleColor = theme.colorScheme.onSurface;
    final contentColor = theme.colorScheme.onSurfaceVariant;
    final errorColor = theme.colorScheme.error;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: dialogBackgroundColor,
        title: Row(
          children: [
            Icon(Icons.error_outline, color: errorColor),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: titleColor,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: contentColor,
              ),
            ),
            if (details != null) ...[
              SizedBox(height: 16),
              ExpansionTile(
                title: Text(t.dialog.error.details),
                children: [
                  SelectableText(
                    details,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'monospace',
                      color: contentColor,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t.dialog.error.close),
          ),
        ],
      ),
    );
  }

  Future<void> showInfo({
    required String title,
    required String message,
  }) async {
    final context = _context;
    if (context == null) return;

    final t = _translations;
    if (t == null) return;

    final theme = Theme.of(context);

    final dialogBackgroundColor = theme.dialogBackgroundColor;
    final titleColor = theme.colorScheme.onSurface;
    final contentColor = theme.colorScheme.onSurfaceVariant;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: dialogBackgroundColor,
        title: Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: titleColor,
          ),
        ),
        content: Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: contentColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(t.dialog.info.ok),
          ),
        ],
      ),
    );
  }

  Future<bool> showErrorWithAction({
    required String title,
    required String message,
    required String actionText,
    String? cancelText,
  }) async {
    final context = _context;
    if (context == null) return false;

    final t = _translations;
    if (t == null) return false;

    final theme = Theme.of(context);

    final dialogBackgroundColor = theme.dialogBackgroundColor;
    final titleColor = theme.colorScheme.onSurface;
    final contentColor = theme.colorScheme.onSurfaceVariant;
    final errorColor = theme.colorScheme.error;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: dialogBackgroundColor,
        title: Row(
          children: [
            Icon(Icons.error_outline, color: errorColor),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: titleColor,
                ),
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: contentColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText ?? t.dialog.confirmation.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(actionText),
          ),
        ],
      ),
    );

    return result ?? false;
  }
}
