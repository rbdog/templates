import 'package:flutter/foundation.dart';
import 'package:my_app/external/implements/console/disabled.dart';
import 'external/implements/console/default.dart';
import 'state/notifiers/logger.dart';

/// デバッグモード
const _debugFilter = LogFilter(
  minLevel: LogLevel.info,
  features: null,
  layers: null,
);

const _debugConsole = DefaultConsole();

/// リリースモード
const _releaseFilter = LogFilter(
  minLevel: LogLevel.error,
  features: null,
  layers: null,
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
