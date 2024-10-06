import 'package:flutter/material.dart';

import 'ifile.dart';
import 'file_size_converter.dart';

class Directory extends StatelessWidget implements IFile {
  
  final String title;
  final bool isInitiallyExpanded;

  final List<IFile> files = [];

  Directory(
    this.title, {
      super.key, 
      this.isInitiallyExpanded = false
    }
  );

  void addFile(IFile file) => files.add(file);

  @override
  int getSize() {
    int sum = 0;

    for (final file in files) {
      sum += file.getSize();
    }

    return sum;
  }

  @override
  Widget render(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
          child: ExpansionTile(
          initiallyExpanded: isInitiallyExpanded,
          leading : const Icon(Icons.folder),
          title   : Text('$title (${FileSizeConverter.bytesToString(getSize())})'),
          children: files.map((IFile file) => file.render(context)).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => render(context);
}