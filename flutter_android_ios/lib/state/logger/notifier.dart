// Project imports:
import '../../external/console/interface.dart';

enum LogLevel {
  error(30),
  warn(20),
  info(10);

  const LogLevel(this.rawValue);
  final int rawValue;
}

class LogFilter {
  const LogFilter({
    required this.minLevel,
    required this.features,
    required this.layers,
  });

  final LogLevel minLevel;
  final List<Feature> features;
  final List<Layer> layers;
}

// TODO: 機能細分化
enum Feature {
  // debugLog,
  // marketAnalytics,
  // auth,
  // appUpdate,
  // l10n,
  // todo,

  general,
}

enum Layer {
  logic,
  state,
  view,
  external_,
}

class Logger {
  Logger({
    required this.console,
    required this.filter,
  });

  final Console console;
  final LogFilter filter;
  Feature? feature;
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
    // フィーチャーフィルター
    if (!filter.features.contains(feature)) return false;
    return true;
  }
}
