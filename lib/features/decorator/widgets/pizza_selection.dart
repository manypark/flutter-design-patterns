import 'package:flutter/material.dart';

const _labels = ['Pizza Margherita', 'Pizza Pepperoni', 'Custom'];

class PizzaSelection extends StatelessWidget {

  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const PizzaSelection({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        ListView.builder(
          addAutomaticKeepAlives: false,
          shrinkWrap  : true,
          itemCount   : _labels.length,
          itemBuilder : (context, index) {

            final item = _labels[index];

            return RadioListTile(
              title       : Text(item),
              value       : index,
              groupValue  : selectedIndex,
              selected    : index == selectedIndex,
              activeColor : Colors.black,
              onChanged   : onChanged,
            );
          },
        ),
      ],
    );
  }
}