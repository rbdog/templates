import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/memo.dart';
import 'package:my_app/state/notifiers/memo_list.dart';

typedef _N = MemoListNotifier;

/// メモ一覧のプロバイダー
final memoListProvider = AsyncNotifierProvider<_N, List<Memo>>(() {
  return _N();
});
