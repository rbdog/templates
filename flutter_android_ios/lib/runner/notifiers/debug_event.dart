import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/features/logger.dart';
import 'package:my_app/runner/providers/api.dart';

/// デバッグ用
class DebugEventNotifier extends Notifier<void> {
  @override
  void build() {}

  // キーボードで入力された数字
  void onEvent(int number) {
    logger.info('---- デバッグイベント ----');
    if (number == 1) {
      logger.info('DEBUG: 1. 遠隔操作でサインアウト');
      ref.read(authProvider).signOut();
    } else {
      logger.info('DEBUG: ?. 登録されていないイベントです');
    }
  }
}
