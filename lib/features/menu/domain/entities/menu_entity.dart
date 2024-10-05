import 'package:flutter/material.dart';

class MenuEntity {

  int index;
  Widget text;
  bool position;

  MenuEntity({
    this.index = 0,
    this.text = const Text(''),
    this.position = false,
  });
  
}
