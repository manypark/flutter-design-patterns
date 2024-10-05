import 'package:flutter/material.dart';

class BurgerInformationLabel extends StatelessWidget {
  
  final String label;

  const BurgerInformationLabel(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}