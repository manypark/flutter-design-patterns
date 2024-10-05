import 'package:flutter/material.dart';

import '../../custom/iwidgets_factory.dart';



class FactorySelection extends StatelessWidget {
  final List<IWidgetsFactory> widgetsFactoryList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const FactorySelection({
    super.key, 
    required this.onChanged,
    required this.selectedIndex,
    required this.widgetsFactoryList,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        for (final (i, widgetsFactory) in widgetsFactoryList.indexed)

          RadioListTile(
            title       : Text(widgetsFactory.getTitle()),
            value       : i,
            groupValue  : selectedIndex,
            selected    : i == selectedIndex,
            activeColor : Colors.black,
            onChanged   : onChanged,
          ),
      ],
    );
  }
}