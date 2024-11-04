import 'package:flutter/material.dart';

class Shape {

  Color color;
  double height;
  double width;

  Shape():
    color   = Colors.black,
    height  = 150.0,
    width   = 150.0;

  Shape.copy(Shape shape):
    color   = shape.color,
    height  = shape.height,
    width   = shape.width;

}
