import 'package:flutter/material.dart';

abstract interface class ISlider {
  Widget render(double value, ValueSetter<double> onChanged);
}