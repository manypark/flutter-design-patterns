
import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../widgets/log_bloc.dart';
import '../widgets/log_message.dart';
import '../widgets/log_messages_column.dart';
import '../widgets/logger_base.dart';
import '../widgets/loggers/loggers.dart';

class ChainOfResponsibilityExample extends StatefulWidget {

  static String path = '/chain-of-responsibility-screen';

  const ChainOfResponsibilityExample({super.key});

  @override
  ChainOfResponsibilityExampleState createState() => ChainOfResponsibilityExampleState();
}

class ChainOfResponsibilityExampleState extends State<ChainOfResponsibilityExample> {

  final logBloc = LogBloc();
  late final LoggerBase logger;
  static final faker = Faker.instance;

  @override
  void initState() {
    super.initState();

    logger = DebugLogger(
      logBloc,
      nextLogger: InfoLogger(
        logBloc,
        nextLogger: ErrorLogger(logBloc),
      ),
    );
  }

  @override
  void dispose() {
    logBloc.dispose();
    super.dispose();
  }

  String get randomLog => faker.lorem.sentence();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body  : SingleChildScrollView(
        padding: const EdgeInsets.symmetric( horizontal:30 ),
        child: Column(
          children: [
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: () => logger.logDebug(randomLog),
              text: 'Log debug',
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: () => logger.logInfo(randomLog),
              text: 'Log info',
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: () => logger.logError(randomLog),
              text: 'Log error',
            ),
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: StreamBuilder<List<LogMessage>>(
                    initialData : const [],
                    stream      : logBloc.outLogStream,
                    builder     : (context, snapshot) => LogMessagesColumn(logMessages: snapshot.data!),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
