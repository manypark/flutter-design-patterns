import 'dart:math';
import 'package:flutter/material.dart';

import 'shape.dart';

class Circle extends Shape {

  static final random = Random();

  Circle(super.color, this.radius);

  Circle.init([super.color = Colors.black]) : radius = 50.0;

  Circle.clone(Circle super.source) :
    radius = source.radius,
    super.clone();

  double radius;

  @override
  Shape clone() => Circle.clone(this);

  @override
  void randomiseProperties() {

    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1.0,
    );
    
    radius = random.nextInt(50).toDouble();
  }

  @override
  Widget render() {
    return SizedBox(
      height: 120.0,
      child : Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height  : 2 * radius,
          width : 2 * radius,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
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