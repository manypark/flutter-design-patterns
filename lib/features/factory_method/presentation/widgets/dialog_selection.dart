import 'package:flutter/material.dart';

import '../custom/custom.dart';

class DialogSelection extends StatelessWidget {

  final List<CustomDialog> customDialogList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const DialogSelection({
    super.key, 
    required this.customDialogList,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final (i, dialog) in customDialogList.indexed)
          RadioListTile(
            title: Text(dialog.getTitle()),
            value: i,
            groupValue: selectedIndex,
            selected: i == selectedIndex,
            activeColor: Colors.black,
            onChanged: onChanged,
          ),
      ],
    );
  }
  
}
