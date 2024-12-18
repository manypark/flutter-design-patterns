import 'package:flutter/material.dart';

import 'itree_collection.dart';

class TreeCollectionSelection extends StatelessWidget {
  final List<ITreeCollection> treeCollections;
  final int selectedIndex;
  final ValueSetter<int?>? onChanged;

  const TreeCollectionSelection({
    super.key,
    required this.treeCollections,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        for (final (i, collection) in treeCollections.indexed)
          RadioListTile(
            title       : Text(collection.getTitle()),
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