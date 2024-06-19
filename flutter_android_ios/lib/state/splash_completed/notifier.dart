// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/firebase_core/provider.dart';
import '../../external/system_locale/provider.dart';
import '../logger.dart';
import 'models.dart';

/// アプリ初期化の結果
class SplashCompletedNotifier extends AsyncNotifier<SplashCompleted> {
  @override
  Future<SplashCompleted> build() async {
    // ログ
    stateLogger.info('アプリの初期化を開始します');

    // これはデモなので適当に3秒まって待機画面を見せる
    // この行を消しても問題ない
    await Future.delayed(const Duration(seconds: 3));

    // Firebaseを初期化
    final firebaseCore = ref.read(firebaseCoreProvider);
    await firebaseCore.init();

    // システムロケールを初期化
    final systemLocale = ref.read(systemLocaleProvider);
    await systemLocale.init();

    stateLogger.info('アプリの初期化が完了しました');

    return SplashCompleted();
  }
}
