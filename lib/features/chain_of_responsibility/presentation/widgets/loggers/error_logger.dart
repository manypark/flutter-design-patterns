import '../log_bloc.dart';
import '../log_level.dart';
import '../logger_base.dart';
import '../mail_service.dart';

class ErrorLogger extends LoggerBase {

  ErrorLogger(
    LogBloc logBloc, {
    super.nextLogger,
  })  : mailService = MailService(logBloc),
        super(logLevel: LogLevel.error);

  final MailService mailService;

  @override
  void log(String message) {
    mailService.sendErrorMail(logLevel, message);
  }

}
