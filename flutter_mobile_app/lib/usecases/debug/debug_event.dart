import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/debug/index.dart';
import '../../di.dart';
import 'provider.dart';

/// デバッグ用
class DebugEventNotifier extends Notifier<void> {
  @override
  void build() {}

  // キーボードで入力された数字
  void executeEvent(int number) {
    final logger = ref.read(loggerProvider(Layer.usecases));
    logger.info('---- デバッグイベント ----');
    if (number == 1) {
      logger.info('DEBUG: 1. 遠隔操作でサインアウト');
      ref.read(firebaseAuthProvider).signOut();
    } else {
      logger.info('DEBUG: ?. 登録されていないイベントです');
    }
  }
}
