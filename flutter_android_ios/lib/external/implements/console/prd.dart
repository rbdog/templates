import 'package:flutter/material.dart';
import 'package:my_app/external/implements/console/colored_string.dart';
import 'package:my_app/external/interfaces/console.dart';

/// prdフレーバー用の Console
class PrdConsole implements Console {
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
    // prd では このレベルのログを出力しない
  }

  @override
  void info(String message) {
    // info では このレベルのログを出力しない
  }
}
