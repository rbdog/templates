// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../di/external.dart';
import '../logger.dart';

/// デバッグ用
class DebugEventNotifier extends Notifier<void> {
  @override
  void build() {}

  // キーボードで入力された数字
  void executeEvent(int number) {
    stateLogger.info('---- デバッグイベント ----');
    if (number == 1) {
      stateLogger.info('DEBUG: 1. 遠隔操作でサインアウト');
      ref.read(authProvider).signOut();
    } else {
      stateLogger.info('DEBUG: ?. 登録されていないイベントです');
    }
  }
}
