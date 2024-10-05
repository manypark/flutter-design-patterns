import '../interfaces/interfaces.dart';

import '../widgets/sliders/sliders.dart';
import '../widgets/switches/switches.dart';
import '../iwidgets_factory.dart';
import '../widgets/activity_indicators/activity_indicators.dart';

class CupertinoWidgetsFactory implements IWidgetsFactory {

  const CupertinoWidgetsFactory();

  @override
  String getTitle() => 'iOS widgets';

  @override
  IActivityIndicator createActivityIndicator() => const IosActivityIndicator();

  @override
  ISlider createSlider() => const IosSlider();

  @override
  ISwitch createSwitch() => const IosSwitch();
}