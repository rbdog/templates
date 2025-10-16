import '../../../adapter/console/interface.dart';
import '../types/log.dart';

class Logger {
  const Logger({
    required this.console,
    required this.filter,
    required this.layer,
  });

  final Console console;
  final LogFilter filter;
  final Layer layer;

  void error(String message) {
    if (_filter(LogLevel.error)) {
      const prefix = '❌ ';
      console.red(prefix + message);
    }
  }

  void warn(String message) {
    if (_filter(LogLevel.warn)) {
      const prefix = '⚠️ ';
      console.yellow(prefix + message);
    }
  }

  void info(String message) {
    if (_filter(LogLevel.info)) {
      const prefix = '✅ ';
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
