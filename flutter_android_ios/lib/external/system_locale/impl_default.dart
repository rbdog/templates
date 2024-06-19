// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:intl/intl_browser.dart' as browser;
import 'package:intl/intl_standalone.dart' as standalone;

// Project imports:
import '../logger.dart';
import 'interface.dart';

/// 共通用システムロケール
class DefaultSystemLocale implements SystemLocale {
  @override
  Future<void> init() async {
    externalLogger.info('システムローケールの初期化を開始します');
    if (kIsWeb) {
      // ブラウザの場合
      await browser.findSystemLocale();
    } else {
      // その他
      await standalone.findSystemLocale();
    }
    externalLogger.info('システムローケールの初期化を完了しました');
  }
}
