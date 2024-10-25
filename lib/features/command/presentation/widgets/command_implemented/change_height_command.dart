import 'dart:math';

import '../shape.dart';
import '../command.dart';

class ChangeHeightCommand implements Command {
  
  ChangeHeightCommand(this.shape) : previousHeight = shape.height;

  final double previousHeight;
  Shape shape;

  @override
  String getTitle() => 'Change height';

  @override
  void execute() => shape.height = (Random().nextInt(150) + 50).toDouble();

  @override
  void undo() => shape.height = previousHeight;
}