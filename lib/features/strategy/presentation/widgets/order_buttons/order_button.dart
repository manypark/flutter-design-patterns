import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class OrderButton extends StatelessWidget {

  final IconData iconData;
  final String title;
  final VoidCallback onPressed;

  const OrderButton({
    super.key,
    required this.iconData,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children    : [
        Icon(
          iconData,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Text(title),
      ],
    );

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: kIsWeb || Platform.isAndroid
          ? MaterialButton(
              color: Colors.black,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.white,
              onPressed: onPressed,
              child: child,
            )
          : CupertinoButton(
              color: Colors.black,
              onPressed: onPressed,
              child: child,
            ),
    );
  }
}