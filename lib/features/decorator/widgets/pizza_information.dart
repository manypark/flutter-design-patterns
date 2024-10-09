import 'package:flutter/material.dart';

import 'pizza/pizza.dart';

class PizzaInformation extends StatelessWidget {

  final Pizza pizza;

  const PizzaInformation({
    super.key,
    required this.pizza,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children          : [

        const SizedBox( height: 20 ),

        Text(
          'Pizza details:',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 30),
        Text(
          pizza.getDescription(),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        Text('Price: \$${pizza.getPrice().toStringAsFixed(2)}'),
      ],
    );
  }
}