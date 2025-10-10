// Project imports:
import '../../adapter/console/interface.dart';
import 'models.dart';

class Logger {
  Logger({required this.console, required this.filter});

  final Console console;
  final LogFilter filter;
  Layer? layer;

  void error(String message) {
    if (_filter(LogLevel.error)) {
      // 先頭に ERROR: とつける
      const prefix = 'ERROR: ';
      // 赤い文字で出力
      console.red(prefix + message);
    }
  }

  void warn(String message) {
    if (_filter(LogLevel.warn)) {
      // 先頭に WARN: とつける
      const prefix = 'WARN: ';
      // 黄色の文字で出力
      console.yellow(prefix + message);
    }
  }

  void info(String message) {
    if (_filter(LogLevel.info)) {
      // 先頭に INFO: とつける
      const prefix = 'INFO: ';
      console.green(prefix + message);
    }
  }

  // true のときに出力する
  bool _filter(LogLevel level) {
    // ログレベルフィルター
    if (filter.minLevel.rawValue > level.rawValue) return false;
    // レイヤーフィルター
    if (!filter.layers.contains(layer)) return false;
    return true;
  }
}
