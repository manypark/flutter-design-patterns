import '../interfaces/interfaces.dart';

import '../widgets/sliders/sliders.dart';
import '../widgets/switches/switches.dart';
import '../iwidgets_factory.dart';
import '../widgets/activity_indicators/activity_indicators.dart';

class MaterialWidgetsFactory implements IWidgetsFactory {
  
  const MaterialWidgetsFactory();

  @override
  String getTitle() => 'Android widgets';

  @override
  IActivityIndicator createActivityIndicator() => const AndroidActivityIndicator();

  @override
  ISlider createSlider() => const AndroidSlider();

  @override
  ISwitch createSwitch() => const AndroidSwitch();
}