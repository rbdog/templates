// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'external/implements/console/disabled.dart';
import 'external/implements/console/default.dart';
import 'state/notifiers/logger.dart';

/// デバッグモード
const _debugFilter = LogFilter(
  // レベル info 以上のログを記録
  minLevel: LogLevel.info,
  // 全フィーチャー
  features: Feature.values,
  // 全レイヤー
  layers: Layer.values,
);

const _debugConsole = DefaultConsole();

/// リリースモード
const _releaseFilter = LogFilter(
  // レベル error 以上のログを記録
  minLevel: LogLevel.error,
  // 全フィーチャー
  features: Feature.values,
  // 全レイヤー
  layers: Layer.values,
);

const _releaseConsole = DisabledConsole();

/// ビルドモードに合わせたロガー
final _buildModeLogger = Logger(
  filter: kReleaseMode ? _releaseFilter : _debugFilter,
  console: kReleaseMode ? _debugConsole : _releaseConsole,
);

/// フィーチャー専用のロガー
Logger get featureLogger {
  _buildModeLogger.feature = Feature.general;
  return _buildModeLogger;
}
