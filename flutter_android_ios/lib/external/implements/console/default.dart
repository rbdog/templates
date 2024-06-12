// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'colored_string.dart';
import '../../interfaces/console.dart';

/// Console
class DefaultConsole implements Console {
  const DefaultConsole();

  @override
  void red(String message) {
    final logString = ColoredString.red(message);
    debugPrint(logString);
  }

  @override
  void green(String message) {
    final logString = ColoredString.yellow(message);
    debugPrint(logString);
  }

  @override
  void yellow(String message) {
    final logString = ColoredString.green(message);
    debugPrint(logString);
  }
}
