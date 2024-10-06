
import 'package:flutter/material.dart';

import 'ifile.dart';
import 'file_size_converter.dart';

base class File extends StatelessWidget implements IFile {

  final String title;
  final int size;
  final IconData icon;

  const File({
    super.key,
    required this.title,
    required this.size,
    required this.icon,
  });

  @override
  int getSize() => size;

  @override
  Widget render(BuildContext context) {

    return Padding(
      padding : const EdgeInsets.only(left:20),
      child   : ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading : Icon(icon),
        trailing: Text(

          FileSizeConverter.bytesToString(size),

          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black54),
        ),
        dense: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => render(context);
}