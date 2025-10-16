import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/debug/index.dart';
import '../../logic/support/index.dart';
import '../debug/provider.dart';
import '../di/adapters.dart';

/// アプリ初期化の結果
class SplashCompletedNotifier
    extends AutoDisposeAsyncNotifier<SplashCompleted> {
  @override
  Future<SplashCompleted> build() async {
    final logger = ref.read(loggerProvider(Layer.state));
    logger.info('アプリの初期化を開始します');

    // これはデモなので適当に3秒まって待機画面を見せる
    // この行を消しても問題ない
    await Future.delayed(const Duration(seconds: 3));

    // Firebaseを初期化
    final firebaseCore = ref.read(firebaseCoreProvider);
    await firebaseCore.init();

    // システムロケールを初期化
    final systemLocale = ref.read(systemLocaleProvider);
    await systemLocale.init();

    logger.info('アプリの初期化が完了しました');

    return SplashCompleted();
  }
}
