import 'dart:math';

import 'package:flutter/material.dart';

import '../shape.dart';
import '../command.dart';

class ChangeColorCommand implements Command {

  ChangeColorCommand(this.shape) : previousColor = shape.color;

  final Color previousColor;
  Shape shape;

  @override
  String getTitle() => 'Change color';

  @override
  void execute() => shape.color = Color.fromRGBO(
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextInt(255),
        1.0,
      );

  @override
  void undo() => shape.color = previousColor;
}