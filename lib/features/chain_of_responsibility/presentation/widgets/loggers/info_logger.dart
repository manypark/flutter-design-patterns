
import '../external_logging_service.dart';
import '../log_bloc.dart';
import '../log_level.dart';
import '../logger_base.dart';

class InfoLogger extends LoggerBase {

  InfoLogger(
    LogBloc logBloc, {
    super.nextLogger,
  })  : externalLoggingService = ExternalLoggingService(logBloc),
        super(logLevel: LogLevel.info);

  final ExternalLoggingService externalLoggingService;

  @override
  void log(String message) {
    externalLoggingService.logMessage(logLevel, message);
  }
}
