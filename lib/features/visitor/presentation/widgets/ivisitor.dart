import 'directory.dart';
import 'concrete_classes/concrete_classes.dart';

abstract interface class IVisitor {
  
  String getTitle();
  String visitDirectory(Directory directory);
  String visitAudioFile(AudioFile file);
  String visitImageFile(ImageFile file);
  String visitTextFile(TextFile file);
  String visitVideoFile(VideoFile file);
  
}
