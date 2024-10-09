import 'package:flutter/material.dart';

import '../widgets/pizza_menu.dart';
import '../widgets/pizza/pizza.dart';
import '../widgets/pizza_selection.dart';
import '../widgets/pizza_information.dart';
import '../widgets/pizza/pizza_topping_data.dart';
import '../widgets/custom_pizza_selection.dart';

class DecoratorExampleScreen extends StatefulWidget {

  static String path = '/decorator-example-screen';

  const DecoratorExampleScreen({super.key});

  @override
  DecoratorExampleState createState() => DecoratorExampleState();
}

class DecoratorExampleState extends State<DecoratorExampleScreen> {

  final pizzaMenu = PizzaMenu();
  late final Map<int, PizzaToppingData> _pizzaToppingsDataMap;
  late Pizza _pizza;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pizzaToppingsDataMap = pizzaMenu.getPizzaToppingsDataMap();
    _pizza = pizzaMenu.getPizza(0, _pizzaToppingsDataMap);
  }

  void _onSelectedIndexChanged(int? index) {
    _setSelectedIndex(index!);
    _setSelectedPizza(index);
  }

  void _setSelectedIndex(int index) => setState(() => _selectedIndex = index);

  void _onCustomPizzaChipSelected(int index, bool? selected) {
    _setChipSelected(index, selected!);
    _setSelectedPizza(_selectedIndex);
  }

  void _setChipSelected(int index, bool selected) => setState(() {
        _pizzaToppingsDataMap[index]!.setSelected(isSelected: selected);
      });

  void _setSelectedPizza(int index) => setState(() {
        _pizza = pizzaMenu.getPizza(index, _pizzaToppingsDataMap);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : SingleChildScrollView(
        padding : const EdgeInsets.symmetric( horizontal:20 ),
        child   : Column(
          children: [
      
            Row(
              children: [
                Text(
                  'Select your pizza:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
      
            PizzaSelection(
              selectedIndex: _selectedIndex,
              onChanged: _onSelectedIndexChanged,
            ),
      
            if (_selectedIndex == 2)
            CustomPizzaSelection(
              pizzaToppingsDataMap: _pizzaToppingsDataMap,
              onSelected: _onCustomPizzaChipSelected,
            ),
      
            PizzaInformation(
              pizza: _pizza,
            ),
      
          ],
        ),
      ),
    );
  }
}
