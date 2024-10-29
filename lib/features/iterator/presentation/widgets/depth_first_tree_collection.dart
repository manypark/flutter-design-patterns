import 'graph.dart';
import 'itree_iterator.dart';
import 'itree_collection.dart';
import 'depth_first_iterator.dart';

class DepthFirstTreeCollection implements ITreeCollection {

  const DepthFirstTreeCollection(this.graph);

  final Graph graph;

  @override
  ITreeIterator createIterator() => DepthFirstIterator(this);

  @override
  String getTitle() => 'Depth-first';

}
