import 'package:logger/logger.dart';

class AppLogger {
  static late Logger _logger;
  static bool _initialized = false;

  static void init({
    Level logLevel = Level.debug,
    bool useColors = true,
    bool printEmojis = true,
    DateTimeFormatter dateTimeFormatter = DateTimeFormat.onlyTimeAndSinceStart
  }) {
    if (_initialized) return;

    _logger = Logger(
      level: logLevel,
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: useColors,
        printEmojis: printEmojis,
        noBoxingByDefault: true,
        dateTimeFormat: dateTimeFormatter
      ),
      output: ConsoleOutput(),
    );

    _initialized = true;
  }

  static void log(
    Level level,
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    if (!_initialized) init();

    _logger.log(level, message, error: error, stackTrace: stackTrace);
  }

  static void trace(dynamic message, {dynamic error, StackTrace? stackTrace}) =>
      log(Level.trace, message, error: error, stackTrace: stackTrace);

  static void debug(dynamic message, {dynamic error, StackTrace? stackTrace}) =>
      log(Level.debug, message, error: error, stackTrace: stackTrace);

  static void info(dynamic message, {dynamic error, StackTrace? stackTrace}) =>
      log(Level.info, message, error: error, stackTrace: stackTrace);

  static void warning(dynamic message, {dynamic error, StackTrace? stackTrace}) =>
      log(Level.warning, message, error: error, stackTrace: stackTrace);

  static void error(dynamic message, {dynamic error, StackTrace? stackTrace}) =>
      log(Level.error, message, error: error, stackTrace: stackTrace);

  static void fatal(dynamic message, {dynamic error, StackTrace? stackTrace}) =>
      log(Level.fatal, message, error: error, stackTrace: stackTrace);
}