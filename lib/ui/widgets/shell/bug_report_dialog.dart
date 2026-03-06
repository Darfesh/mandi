import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BugReportDialog extends StatefulWidget {
  const BugReportDialog({super.key});

  @override
  State<BugReportDialog> createState() => _BugReportDialogState();
}

class _BugReportDialogState extends State<BugReportDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _sendBugReport() async {
    // final deviceInfo = await _getDeviceInfo(); // Screenshot + app versie
    // final mailto =
    //     'mailto:bugs@mandi.app?subject=${Uri.encodeComponent(_titleController.text)}&body=${Uri.encodeComponent(_descriptionController.text + '\n\n' + deviceInfo)}';

    // launchUrl(Uri.parse(mailto));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Report Bug'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: _titleController, decoration: InputDecoration(labelText: 'Bug title')),
          TextField(
            controller: _descriptionController,
            maxLines: 5,
            decoration: InputDecoration(labelText: 'Describe the bug...'),
          ),
          Text('Screenshot + device info wordt automatisch toegevoegd'),
        ],
      ),
      actions: [
        TextButton(onPressed: Navigator.of(context).pop, child: Text('Cancel')),
        ElevatedButton(onPressed: _sendBugReport, child: Text('Send')),
      ],
    );
  }
}
