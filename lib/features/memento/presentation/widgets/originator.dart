import 'shape.dart';
import 'memento.dart';
import 'imemento.dart';

class Originator {
  
  Shape state;

  Originator() : state = Shape();

  IMemento createMemento() => Memento(state);

  void restore(IMemento memento) => state = memento.getState();

}