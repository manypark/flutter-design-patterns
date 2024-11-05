
import 'package:flutter/material.dart';

import 'state_context.dart';

abstract interface class IState {
  Future<void> nextState(StateContext context);
  Widget render();
}
