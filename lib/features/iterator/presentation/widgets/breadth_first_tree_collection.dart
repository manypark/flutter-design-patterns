import 'graph.dart';
import 'itree_iterator.dart';
import 'itree_collection.dart';
import 'breadth_first_iterator.dart';

class BreadthFirstTreeCollection implements ITreeCollection {

  const BreadthFirstTreeCollection(this.graph);

  final Graph graph;

  @override
  ITreeIterator createIterator() => BreadthFirstIterator(this);

  @override
  String getTitle() => 'Breadth-first';
}