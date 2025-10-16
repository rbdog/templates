import 'package:flutter/material.dart';

import '../../__gen__/l10n/l10n.dart';

/// 多言語対応
extension L10n on BuildContext {
  // MEMO: MaterialApp の初期化前に呼び出すとエラー
  AppLocalizations get l10n {
    return AppLocalizations.of(this)!;
  }

  String todoL10n(String hardCoded) {
    return hardCoded;
  }
}
