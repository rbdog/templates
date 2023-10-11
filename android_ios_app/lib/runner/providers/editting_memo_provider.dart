import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/types/memo.dart';
import 'package:my_app/runner/notifiers/editting_memo_notifier.dart';
import 'package:my_app/runner/providers/memo_list_provider.dart';

/// 編集中メモのプロバイダー
final edittingMemoProvider =
    StateNotifierProvider.family<EdittingMemoNotifier, Memo, String>(
  (ref, id) {
    final list = ref.read(memoListProvider);
    final initialState = list.firstWhere(
      (memo) => memo.id == id,
    );
    return EdittingMemoNotifier(initialState);
  },
);
