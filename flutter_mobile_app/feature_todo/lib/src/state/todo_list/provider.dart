// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/todo.dart';
import 'notifier.dart';

typedef _N = TodoListNotifier;

/// Todo一覧のプロバイダー
final todoListProvider = AsyncNotifierProvider<_N, List<Todo>>(() {
  return _N();
});
