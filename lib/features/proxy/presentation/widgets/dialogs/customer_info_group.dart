import 'package:flutter/material.dart';

class CustomerInfoGroup extends StatelessWidget {
  
  final String label;
  final String text;

  const CustomerInfoGroup({
    super.key,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [

        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),

        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),

      ],
    );
  }
}
