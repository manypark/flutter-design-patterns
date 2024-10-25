import 'package:flutter/material.dart';

import '../widgets/command_history_column.dart';
import '../widgets/shape.dart';
import '../widgets/command.dart';
import '../../../shared/shared.dart';
import '../widgets/command_history.dart';
import '../widgets/command_implemented/command_implemented.dart';
import '../widgets/shape_container.dart';

class CommandExampleScreen extends StatefulWidget {

  static String path = '/command-example-screen';

  const CommandExampleScreen({super.key});

  @override
  CommandExampleState createState() => CommandExampleState();
}

class CommandExampleState extends State<CommandExampleScreen> {

  final _commandHistory = CommandHistory();
  
  final _shape = Shape.initial();

  void _changeColor() {
    final command = ChangeColorCommand(_shape);
    _executeCommand(command);
  }

  void _changeHeight() {
    final command = ChangeHeightCommand(_shape);
    _executeCommand(command);
  }

  void _changeWidth() {
    final command = ChangeWidthCommand(_shape);
    _executeCommand(command);
  }

  void _executeCommand(Command command) => setState(() {
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
        padding : const EdgeInsets.symmetric( horizontal:30 ),
        child   : Column(
          children: [
      
            ShapeContainer( shape:_shape ),
      
            const SizedBox(height: 20),
      
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeColor,
              text: 'Change color',
            ),
      
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeHeight,
              text: 'Change height',
            ),
      
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _changeWidth,
              text: 'Change width',
            ),
      
            const Divider(),
      
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _commandHistory.isEmpty ? null : _undo,
              text: 'Undo',
            ),
      
            const SizedBox(height: 20),
      
            Row(
              children:[
                Expanded(
                  child: CommandHistoryColumn( 
                    commandList: _commandHistory.commandHistoryList
                  )
                ),
              ],
            ),
      
          ],
        ),
      ),
    );
  }
}
