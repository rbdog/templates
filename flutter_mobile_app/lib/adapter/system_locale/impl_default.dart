import 'package:flutter/foundation.dart';
import 'package:intl/intl_browser.dart' as browser;
import 'package:intl/intl_standalone.dart' as standalone;

import '../../logic/debug/index.dart';
import 'interface.dart';

/// 共通用システムロケール
class ImplDefault implements SystemLocale {
  const ImplDefault({required this.logger});

  final Logger logger;

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
