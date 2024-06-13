// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension L10n on BuildContext {
  // MEMO: MaterialApp の初期化前に呼び出すとエラー
  /// 多言語対応
  AppLocalizations get l10n {
    return AppLocalizations.of(this)!;
  }
}
