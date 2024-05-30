import 'package:flutter/foundation.dart';
import 'package:my_app/state/notifiers/logger.dart';
import 'package:my_app/external/interfaces/systems_locale.dart';
import 'package:intl/intl_browser.dart' as browser;
import 'package:intl/intl_standalone.dart' as standalone;

/// 共通用システムロケール
class DefaultSystemLocale implements SystemLocale {
  @override
  Future<void> init() async {
    logger.info('システムローケールの初期化を開始します');
    if (kIsWeb) {
      // ブラウザの場合
      await browser.findSystemLocale();
    } else {
      // その他
      await standalone.findSystemLocale();
    }
    logger.info('システムローケールの初期化を完了しました');
  }
}
