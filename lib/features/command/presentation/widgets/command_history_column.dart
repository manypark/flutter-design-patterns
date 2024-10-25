
import 'package:flutter/material.dart';

class CommandHistoryColumn extends StatelessWidget {

  final List<String> commandList;

  const CommandHistoryColumn({
    super.key,
    required this.commandList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [

        Text('Command history:', style: Theme.of(context).textTheme.titleLarge),

        const SizedBox(height: 15),

        if (commandList.isEmpty) const Text('Command history is empty.'),

        if (commandList.isNotEmpty)
        ListView.builder(
          addAutomaticKeepAlives: false,
          physics     : const NeverScrollableScrollPhysics(),
          shrinkWrap  : true,
          itemCount   : commandList.length,
          itemBuilder : (BuildContext context, int index) {
        
            final (i, command) = commandList.indexed.elementAt(index);
        
            return Text('${i + 1}. $command');
          },
        ),
      ],
    );
  }
}