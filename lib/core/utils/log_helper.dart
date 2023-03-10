import 'package:logger/logger.dart';

class LogHelper {
  final logger = Logger(
    printer: PrettyPrinter(
        methodCount: 10, // number of method calls to be displayed
        errorMethodCount:
            10, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true // Should each log print contain a timestamp
        ),
  );

  static final instance = LogHelper._();
  factory LogHelper() {
    return instance;
  }

  LogHelper._();
}
