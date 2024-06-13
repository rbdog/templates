// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/app_init_result.dart';
import '../di/external.dart';

/// アプリ初期化の結果
class AppInitResultNotifier extends AsyncNotifier<AppInitResult> {
  @override
  Future<AppInitResult> build() async {
    // これはデモなので適当に3秒まって待機画面を見せる
    // この行を消しても問題ない
    await Future.delayed(const Duration(seconds: 3));

    // Firebaseを初期化
    final firebaseCore = ref.read(firebaseCoreProvider);
    await firebaseCore.init();

    // システムロケールを初期化
    final systemLocale = ref.read(systemLocaleProvider);
    await systemLocale.init();

    return AppInitResult.ok;
  }
}
