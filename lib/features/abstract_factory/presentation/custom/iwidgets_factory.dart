import 'interfaces/islider.dart';
import 'interfaces/iswitch.dart';
import 'interfaces/iactivity_indicator.dart';

abstract interface class IWidgetsFactory {
  String getTitle();
  IActivityIndicator createActivityIndicator();
  ISlider createSlider();
  ISwitch createSwitch();
}