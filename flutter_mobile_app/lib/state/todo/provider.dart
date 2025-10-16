import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/todo/index.dart';
import 'todo_list.dart';

final todoListProvider =
    AsyncNotifierProvider.autoDispose<TodoListNotifier, List<Todo>>(() {
      return TodoListNotifier();
    });

final todoProvider = FutureProvider.autoDispose.family<Todo, String>((
  ref,
  id,
) async {
  final todos = await ref.watch(todoListProvider.future);
  return todos.firstWhere((it) => it.id == id);
});
