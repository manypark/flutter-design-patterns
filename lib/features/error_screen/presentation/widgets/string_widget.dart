import 'package:flutter/material.dart';

class StringWidget extends StatelessWidget {

  final List<String> data;

  const StringWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.map((item) => Text(item)).toList(),
    );
  }
}
