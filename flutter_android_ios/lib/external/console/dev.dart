import 'package:flutter/material.dart';
import 'package:my_app/external/console/colored_string.dart';
import 'package:my_app/logic/interfaces/console.dart';

/// devフレーバー用の Console
class DevConsole implements Console {
  @override
  void error(String message) {
    // 先頭に ERROR: とつける
    const prefix = 'ERROR: ';
    // 赤い文字で出力
    final logString = ColoredString.red(prefix + message);
    debugPrint(logString);
  }

  @override
  void warn(String message) {
    // 先頭に WARN: とつける
    const prefix = 'WARN: ';
    // 黄色の文字で出力
    final logString = ColoredString.yellow(prefix + message);
    debugPrint(logString);
  }

  @override
  void info(String message) {
    // 先頭に INFO: とつける
    const prefix = 'INFO: ';
    // 緑の文字で出力
    final logString = ColoredString.green(prefix + message);
    debugPrint(logString);
  }
}
