import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../../logic/debug/index.dart';
import 'interface.dart';

/// アプリフレーバー
class ImplDefault implements AppFlavor {
  @override
  Flavor getFlavor() {
    final flavor = switch (appFlavor) {
      'dev' => Flavor.dev,
      'stg' => Flavor.stg,
      'prd' => Flavor.prd,
      _ => null,
    };
    if (flavor == null) {
      debugPrint('flavor が指定されていません. dev を使用します.');
      return Flavor.dev;
    }
    return flavor;
  }
}
