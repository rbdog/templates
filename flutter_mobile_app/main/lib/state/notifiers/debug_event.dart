// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:

/// デバッグ用
class DebugEventNotifier extends Notifier<void> {
  @override
  void build() {}

  // キーボードで入力された数字
  void executeEvent(int number) {
    print('---- デバッグイベント ----');
  }
}
