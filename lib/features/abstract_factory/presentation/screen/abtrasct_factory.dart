import 'package:flutter/material.dart';

import '../custom/iwidgets_factory.dart';
import '../custom/interfaces/interfaces.dart';
import 'package:design_patterns/config/config.dart';
import '../custom/factories/material_widgets_factory.dart';
import '../custom/factories/cupertino_widgets_factory.dart';
import '../widgets/column/factory_selection.dart';

class AbstractFactoryExample extends StatefulWidget {

  static String path = '/abstract-factory-screen';

  const AbstractFactoryExample({super.key});

  @override
  AbstractFactoryExampleState createState() => AbstractFactoryExampleState();
}

class AbstractFactoryExampleState extends State<AbstractFactoryExample> {
  
  final List<IWidgetsFactory> widgetsFactoryList = const [
    MaterialWidgetsFactory(),
    CupertinoWidgetsFactory(),
  ];

  var _selectedFactoryIndex = 0;

  late IActivityIndicator _activityIndicator;

  late ISlider _slider;
  var _sliderValue = 50.0;
  String get _sliderValueString => _sliderValue.toStringAsFixed(0);

  late ISwitch _switch;
  var _switchValue = false;
  String get _switchValueString => _switchValue ? 'ON' : 'OFF';

  @override
  void initState() {
    super.initState();
    _createWidgets();
  }

  void _createWidgets() {
    _activityIndicator = widgetsFactoryList[_selectedFactoryIndex].createActivityIndicator();
    _slider = widgetsFactoryList[_selectedFactoryIndex].createSlider();
    _switch = widgetsFactoryList[_selectedFactoryIndex].createSwitch();
  }

  void _setSelectedFactoryIndex(int? index) {
    if (index == null) return;

    setState(() {
      _selectedFactoryIndex = index;
      _createWidgets();
    });
  }

  void _setSliderValue(double value) => setState(() => _sliderValue = value);

  void _setSwitchValue(bool value) => setState(() => _switchValue = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child   : SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: LayoutConstants.paddingL,
          ),
          child: Column(
            children: [
      
              FactorySelection(
                widgetsFactoryList: widgetsFactoryList,
                selectedIndex     : _selectedFactoryIndex,
                onChanged         : _setSelectedFactoryIndex,
              ),
      
              const SizedBox(height: LayoutConstants.spaceL),
      
              Text(
                'Widgets showcase',
                style: Theme.of(context).textTheme.titleLarge,
              ),
      
              const SizedBox(height: LayoutConstants.spaceXL),
      
              Text(
                'Process indicator',
                style: Theme.of(context).textTheme.titleMedium,
              ),
      
              const SizedBox(height: LayoutConstants.spaceL),
      
              _activityIndicator.render(),
      
              const SizedBox(height: LayoutConstants.spaceXL),
      
              Text(
                'Slider ($_sliderValueString%)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
      
              const SizedBox(height: LayoutConstants.spaceL),
      
              _slider.render(_sliderValue, _setSliderValue),
      
              const SizedBox(height: LayoutConstants.spaceXL),
      
              Text(
                'Switch ($_switchValueString)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
      
              const SizedBox(height: LayoutConstants.spaceL),
      
              _switch.render(
                value: _switchValue,
                onChanged: _setSwitchValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}