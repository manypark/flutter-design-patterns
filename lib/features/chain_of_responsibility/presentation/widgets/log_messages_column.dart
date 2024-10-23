import 'package:flutter/material.dart';

import 'log_message.dart';

class LogMessagesColumn extends StatelessWidget {

  final List<LogMessage> logMessages;

  const LogMessagesColumn({
    super.key,
    required this.logMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [

        ListView.builder(
          addAutomaticKeepAlives: false,
          shrinkWrap  : true,
          itemCount   : logMessages.length,
          itemBuilder : (context, index) {

            final logMessage = logMessages[index];

            return Row(
              children: [
                Expanded( child:logMessage.getFormattedMessage() ),
              ],
            );

          },
        ),

        // for (final logMessage in logMessages)
        //   Row(
        //     children: <Widget>[
        //       Expanded(child: logMessage.getFormattedMessage()),
        //     ],
        //   ),
      ],
    );
  }
}