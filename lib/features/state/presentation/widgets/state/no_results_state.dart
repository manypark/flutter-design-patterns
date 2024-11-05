import 'package:flutter/material.dart';

import '../istate.dart';
import 'loading_state.dart';
import '../state_context.dart';

class NoResultsState implements IState {

  const NoResultsState();

  @override
  Future<void> nextState(StateContext context) async {
    context.setState(const LoadingState());
  }

  @override
  Widget render() {
    return const Text(
      'No Results',
      style: TextStyle(fontSize: 24.0),
      textAlign: TextAlign.center,
    );
  }
}