import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/todo.dart';
import 'package:my_app/state/notifiers/todo_list.dart';

typedef _N = TodoListNotifier;

/// Todo一覧のプロバイダー
final todoListProvider = AsyncNotifierProvider<_N, List<Todo>>(() {
  return _N();
});