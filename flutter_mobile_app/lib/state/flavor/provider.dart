// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import '../../logic/flavor/types/flavor.dart';

final flavor = _getFlavor();

Flavor _getFlavor() {
  final flavor = switch (appFlavor) {
    'dev' => Flavor.dev,
    'stg' => Flavor.stg,
    'prd' => Flavor.prd,
    _ => null,
  };
  if (flavor == null) {
    debugPrint('Flavorが指定されていないため dev を設定します');
    return Flavor.dev;
  }
  return flavor;
}
