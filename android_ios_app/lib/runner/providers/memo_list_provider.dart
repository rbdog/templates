import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/types/memo.dart';
import 'package:my_app/runner/notifiers/memo_list_notifier.dart';

/// メモ一覧のプロバイダー
final memoListProvider = StateNotifierProvider<MemoListNotifier, List<Memo>>(
  (ref) {
    return MemoListNotifier([]);
  },
);
