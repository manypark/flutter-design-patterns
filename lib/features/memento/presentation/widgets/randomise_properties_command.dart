import 'dart:math';

import 'package:flutter/material.dart';

import 'icommand.dart';
import 'imemento.dart';
import 'originator.dart';

class RandomisePropertiesCommand implements ICommand {

  final IMemento _backup;
  final Originator originator;

  RandomisePropertiesCommand(this.originator) : _backup = originator.createMemento();

  @override
  void execute() {
    
    final shape = originator.state;

    shape.color = Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      1.0,
    );

    shape.height  = (Random().nextInt(150) + 50).toDouble();
    shape.width   = (Random().nextInt(150) + 50).toDouble();
  }

  @override
  void undo() => originator.restore(_backup);

}