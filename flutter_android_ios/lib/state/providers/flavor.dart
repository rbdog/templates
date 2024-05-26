import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/flavor.dart';

final flavorProvider = Provider((ref) {
  final flavor = readFlavor();
  return flavor;
});

/// 設定されたフレーバーを読み取る
Flavor readFlavor() {
  const flavorString = String.fromEnvironment('flavor');
  if (flavorString == 'dev') {
    return Flavor.dev;
  } else if (flavorString == 'stg') {
    return Flavor.stg;
  } else if (flavorString == 'prd') {
    return Flavor.prd;
  }
  debugPrint('Flavorが指定されていないため dev を設定します');
  return Flavor.dev;
}
