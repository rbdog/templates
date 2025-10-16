import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/debug/index.dart';
import '../di/adapters.dart';
import 'provider.dart';

/// デバッグ用
class DebugEventNotifier extends AutoDisposeNotifier<void> {
  @override
  void build() {}

  // キーボードで入力された数字
  void executeEvent(int number) {
    final logger = ref.read(loggerProvider(Layer.state));
    logger.info('---- デバッグイベント ----');
    if (number == 1) {
      logger.info('DEBUG: 1. 遠隔操作でサインアウト');
      ref.read(firebaseAuthProvider).signOut();
    } else {
      logger.info('DEBUG: ?. 登録されていないイベントです');
    }
  }
}
