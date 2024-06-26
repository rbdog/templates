// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'external/console/impl_default.dart';
import 'external/console/impl_disabled.dart';
import 'state/logger/models.dart';
import 'state/logger/notifier.dart';

/// デバッグモード
const _debugFilter = LogFilter(
  // レベル info 以上のログを記録
  minLevel: LogLevel.info,
  // 全レイヤー
  layers: Layer.values,
);

const _debugConsole = ImplDefault();

/// リリースモード
const _releaseFilter = LogFilter(
  // レベル error 以上のログを記録
  minLevel: LogLevel.error,
  // 全レイヤー
  layers: Layer.values,
);

const _releaseConsole = ImplDisabled();

/// ビルドモードに合わせたロガー
final buildModeLogger = Logger(
  filter: kReleaseMode ? _releaseFilter : _debugFilter,
  console: kReleaseMode ? _debugConsole : _releaseConsole,
);
