import 'package:flutter/material.dart';

import 'pizza/pizza_topping_data.dart';

class CustomPizzaSelection extends StatelessWidget {
  
  final Map<int, PizzaToppingData> pizzaToppingsDataMap;
  final Function(int, bool?) onSelected;

  const CustomPizzaSelection({
    super.key,
    required this.pizzaToppingsDataMap,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child : ListView.builder(
        addAutomaticKeepAlives: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap  : true,
        itemCount   : pizzaToppingsDataMap.length,
        itemBuilder : (context, index) {
          return index == 0
          ? _ChoiceChip(
              label: 'Pizza Base',
              selected: true,
              onSelected: (_) {},
            )
          : Padding(
            padding : const EdgeInsets.only( left: 10 ),
            child   : _ChoiceChip(
                label     : pizzaToppingsDataMap[index]!.label,
                selected  : pizzaToppingsDataMap[index]!.selected,
                onSelected: (bool? selected) => onSelected(index, selected),
              ),
          );
        }
      ),
    );
  }
}

class _ChoiceChip extends StatelessWidget {

  const _ChoiceChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final ValueSetter<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    final color = selected ? Colors.white : Colors.black;

    return ChoiceChip(
      color: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }

        return Colors.white;
      }),
      label: Text(label),
      labelStyle: TextStyle(color: color),
      checkmarkColor: color,
      selected: selected,
      onSelected: onSelected,
    );
  }
}