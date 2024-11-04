import 'package:flutter/material.dart';

import '../widgets/icommand.dart';
import '../widgets/originator.dart';
import '../widgets/command_history.dart';
import '../widgets/shape_container_memento.dart';
import '../widgets/randomise_properties_command.dart';
import 'package:design_patterns/features/shared/shared.dart';

class MementoExampleScreen extends StatefulWidget {

  static String path = '/memento-screen-example';

  const MementoExampleScreen({super.key});

  @override
  MementoExampleState createState() => MementoExampleState();
}

class MementoExampleState extends State<MementoExampleScreen> {

  final _commandHistory = CommandHistory();
  final _originator     = Originator();

  void _randomiseProperties() {
    final command = RandomisePropertiesCommand(_originator);
    _executeCommand(command);
  }

  void _executeCommand(ICommand command) => setState(() {
      command.execute();
      _commandHistory.add(command);
    }
  );

  void _undo() => setState(() => _commandHistory.undo());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body  : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children:[
      
            ShapeContainerMemento( shape: _originator.state ),
      
            const SizedBox(height: 20),
      
            PlatformButton(
              materialColor     : Colors.black,
              materialTextColor : Colors.white,
              onPressed         : _randomiseProperties,
              text              : 'Randomise properties',
            ),
      
            const Divider(),
      
            PlatformButton(
              materialColor     : Colors.black,
              materialTextColor : Colors.white,
              onPressed         : _commandHistory.isEmpty ? null : _undo,
              text              : 'Undo',
            ),
      
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}