import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/shape_type.dart';
import '../widgets/shape_factory.dart';
import '../widgets/ipositioned_shape.dart';
import '../widgets/shape_flyweight_factory.dart';
import '../widgets/positioned_shape_wrapper.dart';

class FlyweightExample extends StatefulWidget {

  static String path = '/fyweight-example-screen';

  const FlyweightExample({super.key});

  @override
  FlyweightExampleState createState() => FlyweightExampleState();
}

class FlyweightExampleState extends State<FlyweightExample> {
  
  static const shapesCount = 1000;

  final shapeFactory = const ShapeFactory();

  late final ShapeFlyweightFactory _shapeFlyweightFactory;

  late List<IPositionedShape> _shapesList;

  int _shapeInstancesCount = 0;

  bool _useFlyweightFactory = false;

  @override
  void initState() {

    super.initState();

    _shapeFlyweightFactory = ShapeFlyweightFactory(shapeFactory: shapeFactory);

    _buildShapesList();
  }

  void _buildShapesList() {

    int shapeInstancesCount = 0;

    _shapesList = <IPositionedShape>[];

    for (var i = 0; i < shapesCount; i++) {

      final shapeType = _getRandomShapeType();

      final shape = _useFlyweightFactory ? _shapeFlyweightFactory.getShape(shapeType) : shapeFactory.createShape(shapeType);

      shapeInstancesCount++;

      _shapesList.add(shape);
    }

    setState(() {
      _shapeInstancesCount = _useFlyweightFactory
          ? _shapeFlyweightFactory.getShapeInstancesCount()
          : shapeInstancesCount;
    });
  }

  ShapeType _getRandomShapeType() {

    const values = ShapeType.values;

    return values[Random().nextInt(values.length)];
  }

  void _toggleUseFlyweightFactory(bool value) {

    setState(() => _useFlyweightFactory = value);

    _buildShapesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : Stack(
        children: [

          ..._shapesList.map((e) => PositionedShapeWrapper(shape:e)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children          : [
              SwitchListTile.adaptive(
                title: const Text(
                  'Use flyweight factory',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                activeColor : Colors.black,
                value       : _useFlyweightFactory,
                onChanged   : _toggleUseFlyweightFactory,
              ),
            ],
          ),

          Center(
            child: Text(
              'Shape instances count: $_shapeInstancesCount',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}