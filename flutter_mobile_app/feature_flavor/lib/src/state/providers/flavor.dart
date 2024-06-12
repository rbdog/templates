// Package imports:
import 'package:riverpod/riverpod.dart';

// Project imports:
import '../../logic/types/flavor.dart';

final flavorProvider = Provider((ref) {
  final flavor = _readFlavor();
  return flavor;
});

/// 設定されたフレーバーを読み取る
Flavor _readFlavor() {
  const flavorString = String.fromEnvironment('flavor');
  if (flavorString == 'dev') {
    return Flavor.dev;
  } else if (flavorString == 'stg') {
    return Flavor.stg;
  } else if (flavorString == 'prd') {
    return Flavor.prd;
  }
  print('Flavorが指定されていないため dev を設定します');
  return Flavor.dev;
}
