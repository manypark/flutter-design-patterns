import 'shape.dart';
import 'imemento.dart';

class Memento implements IMemento {

  final Shape _state;

  Memento(Shape shape) : _state = Shape.copy(shape);

  @override
  Shape getState() => _state;

}