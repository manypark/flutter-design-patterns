
import 'package:flutter/material.dart';

import '../../../shared/widgets/widget.dart';

class FilesDialog extends StatelessWidget {

  const FilesDialog({
    super.key,
    required this.filesText,
  });

  final String filesText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Files'),
      content: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(filesText),
          ),
        ),
      ),
      actions:[
        PlatformButton(
          materialColor: Colors.black,
          materialTextColor: Colors.white,
          onPressed: Navigator.of(context).pop,
          text: 'Close',
        ),
      ],
    );
  }
}