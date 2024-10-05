import 'package:flutter/material.dart';

abstract class CustomDialog {

  const CustomDialog();

  String getTitle();
  
  Widget create(BuildContext context);

  Future<void> show(BuildContext context) => showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: create,
  );
}
