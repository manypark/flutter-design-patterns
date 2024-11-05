import 'package:flutter/material.dart';

import '../widgets/istate.dart';
import '../widgets/state_context.dart';
import '../widgets/state/no_results_state.dart';
import 'package:design_patterns/features/shared/shared.dart';

class StateExampleScreen extends StatefulWidget {

  static String path = '/state-example-screen';

  const StateExampleScreen({super.key});

  @override
  StateExampleState createState() => StateExampleState();
}

class StateExampleState extends State<StateExampleScreen> {

  final _stateContext = StateContext();

  Future<void> _changeState() async {
    await _stateContext.nextState();
  }

  @override
  void dispose() {
    _stateContext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : SingleChildScrollView(
        padding : const EdgeInsets.symmetric( horizontal:20 ),
        child   : Column(
          children: [
      
            PlatformButton(
              materialColor     : Colors.black,
              materialTextColor : Colors.white,
              onPressed         : _changeState,
              text              : 'Load names',
            ),
      
            const SizedBox(height: 30),
      
            StreamBuilder<IState>(
              initialData : const NoResultsState(),
              stream      : _stateContext.outState,
              builder     : (context, snapshot) => snapshot.data!.render(),
            ),
          ],
        ),
      ),
    );
  }
}