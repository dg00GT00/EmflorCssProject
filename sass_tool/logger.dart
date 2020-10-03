import 'package:logging/logging.dart';

abstract class BaseLogger {
  String loggerName;

  Logger get logger => Logger(loggerName);

  void log(Level level, String message);
}

class DefaultLogger extends BaseLogger {
  DefaultLogger() {
    _generateLoggerInfo();
  }

  void _generateLoggerInfo() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord record) {
      print(
          '[${record.level.name.toUpperCase()}]: ${record.time}: ${record.message}');
    });
  }

  @override
  void log(Level level, String message) {
    logger.log(level, message);
  }
}
