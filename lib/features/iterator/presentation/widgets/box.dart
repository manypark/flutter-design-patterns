import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final int nodeId;
  final Color color;
  final Widget? child;

  const Box({
    super.key,
    required this.nodeId,
    required this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              nodeId.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}