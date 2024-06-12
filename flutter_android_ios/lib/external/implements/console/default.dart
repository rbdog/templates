import 'package:flutter/material.dart';
import 'package:my_app/external/implements/console/colored_string.dart';
import 'package:my_app/external/interfaces/console.dart';

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
