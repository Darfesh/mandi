import 'package:flutter/material.dart';
import 'package:mandi/i18n/strings.g.dart';

class DeleteAccountDialog extends StatefulWidget {
  final String title;
  final String message;

  const DeleteAccountDialog({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  final _controller = TextEditingController();
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      _isValid = _controller.text.toLowerCase() == 'delete';
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = Translations.of(context);

    final dialogBackgroundColor = theme.dialogBackgroundColor;
    final titleColor = theme.colorScheme.onSurface;
    final contentColor = theme.colorScheme.onSurfaceVariant;

    return AlertDialog(
      backgroundColor: dialogBackgroundColor,
      title: Text(
        widget.title,
        style: theme.textTheme.headlineSmall?.copyWith(
          color: titleColor,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.message,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: contentColor,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'DELETE',
              helperText: 'Type delete to confirm',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _isValid ? theme.colorScheme.primary : theme.colorScheme.error,
                ),
              ),
            ),
            autofocus: true,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(t.dialog.confirmation.cancel),
        ),
        TextButton(
          onPressed: _isValid ? () => Navigator.of(context).pop(true) : null,
          style: TextButton.styleFrom(
            foregroundColor: theme.colorScheme.error,
          ),
          child: Text('Delete'),
        ),
      ],
    );
  }
}
