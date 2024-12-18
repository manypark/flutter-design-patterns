import 'package:flutter/material.dart';

import '../fake_api.dart';
import '../istate.dart';
import 'error_state.dart';
import 'loaded_state.dart';
import 'no_results_state.dart';
import '../state_context.dart';

class LoadingState implements IState {

  final FakeApi api;
  
  const LoadingState({
    this.api = const FakeApi(),
  });


  @override
  Future<void> nextState(StateContext context) async {
    try {
      final resultList = await api.getNames();

      context.setState(
        resultList.isEmpty ? const NoResultsState() : LoadedState(resultList),
      );
    } on Exception {
      context.setState(const ErrorState());
    }
  }

  @override
  Widget render() {
    return const CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black,
      ),
    );
  }
}