
import 'dart:math';

import '../command.dart';
import '../shape.dart';

class ChangeWidthCommand implements Command {

  ChangeWidthCommand(this.shape) : previousWidth = shape.width;

  final double previousWidth;
  Shape shape;

  @override
  String getTitle() => 'Change width';

  @override
  void execute() => shape.width = (Random().nextInt(150) + 50).toDouble();

  @override
  void undo() => shape.width = previousWidth;
}