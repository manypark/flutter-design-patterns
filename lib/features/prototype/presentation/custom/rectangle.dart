import 'dart:math';
import 'package:flutter/material.dart';

import 'shape.dart';

class Rectangle extends Shape {

  static final random = Random();
  double _height;
  double _width;


  Rectangle(super.color, this._height, this._width);

  Rectangle.init({Color color = Colors.black})
  : _height = 100.0,
    _width = 100.0,
    super(color);


  Rectangle.clone(
    Rectangle super.source
  ) : _height  = source._height, 
      _width   = source._width, 
      super.clone();

  @override
  Shape clone() => Rectangle.clone(this);

  @override
  void randomiseProperties() {
    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1.0,
    );
    _height = random.nextInt(100).toDouble();
    _width  = random.nextInt(100).toDouble();
  }

  @override
  Widget render() {
    return SizedBox(
      height: 120.0,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height  : _height,
          width   : _width,
          decoration: BoxDecoration(
            color: color,
          ),
          child: const Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}