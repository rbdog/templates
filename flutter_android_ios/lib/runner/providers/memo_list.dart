import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/types/memo.dart';
import 'package:my_app/runner/notifiers/memo_list.dart';

typedef _N = MemoListNotifier;

/// メモ一覧のプロバイダー
final memoListProvider = AsyncNotifierProvider<_N, List<Memo>>(() {
  return _N();
});
