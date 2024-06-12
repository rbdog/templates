// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:intl/intl_browser.dart' as browser;
import 'package:intl/intl_standalone.dart' as standalone;

import '../../interfaces/systems_locale.dart';

// Project imports:

/// 共通用システムロケール
class DefaultSystemLocale implements SystemLocale {
  @override
  Future<void> init() async {
    if (kIsWeb) {
      // ブラウザの場合
      await browser.findSystemLocale();
    } else {
      // その他
      await standalone.findSystemLocale();
    }
  }
}
