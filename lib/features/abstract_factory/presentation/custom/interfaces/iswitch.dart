import 'package:flutter/material.dart';

abstract interface class ISwitch {
  Widget render({required bool value, required ValueSetter<bool> onChanged});
}