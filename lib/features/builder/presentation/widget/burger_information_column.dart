
import 'package:design_patterns/config/config.dart';
import 'package:flutter/material.dart';

import '../custom/burger.dart';
import 'burger_information_label.dart';

class BurgerInformationColumn extends StatelessWidget {

  final Burger burger;

  const BurgerInformationColumn({
    super.key,
    required this.burger,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const BurgerInformationLabel('Price'),
        Text(burger.getFormattedPrice()),
        const SizedBox(height: LayoutConstants.spaceM),
        const BurgerInformationLabel('Ingredients'),
        Text(
          burger.getFormattedIngredients(),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: LayoutConstants.spaceM),
        const BurgerInformationLabel('Allergens'),
        Text(
          burger.getFormattedAllergens(),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}