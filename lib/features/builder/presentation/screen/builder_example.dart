
import 'package:design_patterns/config/config.dart';
import 'package:flutter/material.dart';

import '../custom/builders/builders.dart';
import '../custom/burger.dart';
import '../custom/director_class/burger_maker.dart';
import '../widget/burger_information_column.dart';
import '../widget/burger_menu_item.dart';

class BuilderExampleScreen extends StatefulWidget {

  static String path = '/builder-screen';

  const BuilderExampleScreen({super.key});

  @override
  BuilderExampleState createState() => BuilderExampleState();
}

class BuilderExampleState extends State<BuilderExampleScreen> {

  final _burgerMaker = BurgerMaker(HamburgerBuilder());
  final List<BurgerMenuItem> _burgerMenuItems = [];

  late BurgerMenuItem _selectedBurgerMenuItem;
  late Burger _selectedBurger;

  @override
  void initState() {
    super.initState();

    _burgerMenuItems.addAll([
      BurgerMenuItem(label: 'Hamburger', burgerBuilder: HamburgerBuilder()),
      BurgerMenuItem(
        label: 'Cheeseburger',
        burgerBuilder: CheeseburgerBuilder(),
      ),
      BurgerMenuItem(label: 'Big Mac\u00AE', burgerBuilder: BigMacBuilder()),
      BurgerMenuItem(
        label: 'McChicken\u00AE',
        burgerBuilder: McChickenBuilder(),
      )
    ]);

    _selectedBurgerMenuItem = _burgerMenuItems[0];
    _selectedBurger = _prepareSelectedBurger();
  }

  Burger _prepareSelectedBurger() {
    _burgerMaker.prepareBurger();

    return _burgerMaker.getBurger();
  }

  void _onBurgerMenuItemChanged(BurgerMenuItem? selectedItem) => setState(() {
        _selectedBurgerMenuItem = selectedItem!;
        _burgerMaker.changeBurgerBuilder(selectedItem.burgerBuilder);
        _selectedBurger = _prepareSelectedBurger();
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstants.paddingL,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children          : [

              Row(
                children: [
                  Text(
                    'Select menu item:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),

              Padding(
                padding : const EdgeInsets.only( right: 20 ),
                child   : DropdownButton(
                  value: _selectedBurgerMenuItem,
                  items: _burgerMenuItems.map<DropdownMenuItem<BurgerMenuItem>>(
                    (BurgerMenuItem item) => DropdownMenuItem(
                      value: item,
                      child: Text(item.label),
                    ),
                  ).toList(),
                  onChanged: _onBurgerMenuItemChanged,
                ),
              ),

              const SizedBox(height: LayoutConstants.spaceL),

              Row(
                children: <Widget>[
                  Text(
                    'Information:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),

              const SizedBox(height: LayoutConstants.spaceM),

              BurgerInformationColumn(burger: _selectedBurger),
            ],
          ),
        ),
      ),
    );
  }
}