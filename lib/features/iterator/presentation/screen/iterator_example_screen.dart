import 'package:flutter/material.dart';

import '../widgets/box.dart';
import '../widgets/graph.dart';
import '../widgets/itree_collection.dart';
import '../widgets/tree_collection_selection.dart';
import '../widgets/depth_first_tree_collection.dart';
import '../widgets/breadth_first_tree_collection.dart';
import 'package:design_patterns/features/shared/shared.dart';

class IteratorExampleScreen extends StatefulWidget {

  static String path = '/iterator-example-screen';

  const IteratorExampleScreen({super.key});

  @override
  IteratorExampleState createState() => IteratorExampleState();
}

class IteratorExampleState extends State<IteratorExampleScreen> {
  final List<ITreeCollection> treeCollections = [];

  var _selectedTreeCollectionIndex = 0;
  int? _currentNodeIndex = 0;
  var _isTraversing = false;

  @override
  void initState() {
    super.initState();

    final graph = _buildGraph();

    treeCollections
      ..add(BreadthFirstTreeCollection(graph))
      ..add(DepthFirstTreeCollection(graph));
  }

  Graph _buildGraph() => Graph()
    ..addEdge(1, 2)
    ..addEdge(1, 3)
    ..addEdge(1, 4)
    ..addEdge(2, 5)
    ..addEdge(3, 6)
    ..addEdge(3, 7)
    ..addEdge(4, 8);

  void _setSelectedTreeCollectionIndex(int? index) {
    if (index == null) return;

    setState(() => _selectedTreeCollectionIndex = index);
  }

  Future<void> _traverseTree() async {
    _toggleIsTraversing();

    final iterator = treeCollections[_selectedTreeCollectionIndex].createIterator();

    while (iterator.hasNext()) {
      if (!mounted) return;

      setState(() => _currentNodeIndex = iterator.getNext());

      await Future.delayed(const Duration(seconds: 1));
    }

    _toggleIsTraversing();
  }

  void _toggleIsTraversing() => setState(() => _isTraversing = !_isTraversing);

  void _reset() => setState(() => _currentNodeIndex = 0);

  Color _getBackgroundColor(int index) => _currentNodeIndex == index ? Colors.red[200]! : Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            TreeCollectionSelection(
              treeCollections : treeCollections,
              selectedIndex   : _selectedTreeCollectionIndex,
              onChanged       : !_isTraversing ? _setSelectedTreeCollectionIndex : null,
            ),
            const SizedBox(height: 30),
            Wrap(
              alignment : WrapAlignment.center,
              children  : [
                PlatformButton(
                  materialColor: Colors.black,
                  materialTextColor: Colors.white,
                  onPressed: _currentNodeIndex == 0 ? _traverseTree : null,
                  text: 'Traverse',
                ),
                PlatformButton(
                  materialColor: Colors.black,
                  materialTextColor: Colors.white,
                  onPressed:
                      _isTraversing || _currentNodeIndex == 0 ? null : _reset,
                  text: 'Reset',
                ),
              ],
            ),
            const SizedBox(height: 30),
            Box(
              nodeId: 1,
              color: _getBackgroundColor(1),
              child: SingleChildScrollView(
                scrollDirection : Axis.horizontal,
                child           : Row(
                  mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                  children          : [
                    Box(
                      nodeId: 2,
                      color: _getBackgroundColor(2),
                      child: Box(
                        nodeId: 5,
                        color: _getBackgroundColor(5),
                      ),
                    ),
                    Box(
                      nodeId: 3,
                      color : _getBackgroundColor(3),
                      child : Row(
                        mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                        children          :[
                          Box(
                            nodeId: 6,
                            color: _getBackgroundColor(6),
                          ),
                          Box(
                            nodeId: 7,
                            color: _getBackgroundColor(7),
                          ),
                        ],
                      ),
                    ),
                    Box(
                      nodeId: 4,
                      color: _getBackgroundColor(4),
                      child: Box(
                        nodeId: 8,
                        color: _getBackgroundColor(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}