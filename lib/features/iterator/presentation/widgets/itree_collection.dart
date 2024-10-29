import 'itree_iterator.dart';

abstract interface class ITreeCollection {
  ITreeIterator createIterator();
  String getTitle();
}