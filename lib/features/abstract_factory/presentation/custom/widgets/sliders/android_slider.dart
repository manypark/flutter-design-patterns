import 'package:flutter/material.dart';

import '../../interfaces/islider.dart';

class AndroidSlider implements ISlider {
  
  const AndroidSlider();

  @override
  Widget render(double value, ValueSetter<double> onChanged) {
    return Slider(
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
      max: 100.0,
      value: value,
      onChanged: onChanged,
    );
  }
}