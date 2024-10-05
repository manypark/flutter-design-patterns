import 'package:flutter/material.dart';

import '../custom/shape.dart';
import '../custom/circle.dart';
import '../custom/rectangle.dart';
import '../widgets/shape_column.dart';

class PrototypeExample extends StatefulWidget {

  static String path = '/prototype-screen';

  const PrototypeExample({super.key});

  @override
  PrototypeExampleState createState() => PrototypeExampleState();
}

class PrototypeExampleState extends State<PrototypeExample> {

  final _circle     = Circle.init();
  final _rectangle  = Rectangle.init();

  Shape? _circleClone;
  Shape? _rectangleClone;

  void _randomiseCircleProperties() => setState(
    () => _circle.randomiseProperties()
  );

  void _cloneCircle() => setState( () => _circleClone = _circle.clone() );

  void _randomiseRectangleProperties() => setState(
    () => _rectangle.randomiseProperties(),
  );

  void _cloneRectangle() => setState(
    () => _rectangleClone = _rectangle.clone(),
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body  : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [

            ShapeColumn(
              shape: _circle,
              shapeClone: _circleClone,
              onClonePressed: _cloneCircle,
              onRandomisePropertiesPressed: _randomiseCircleProperties,
            ),

            const SizedBox( height:12 ),

            const Divider(),

            const SizedBox( height:12 ),

            ShapeColumn(
              shape: _rectangle,
              shapeClone: _rectangleClone,
              onClonePressed: _cloneRectangle,
              onRandomisePropertiesPressed: _randomiseRectangleProperties,
            ),

          ],
        ),
      ),
    );
  }
}
