import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/todo/index.dart';
import '../stateless_components/loading_view.dart';
import '../stateless_components/todo_list_view.dart';

class TodoListViewContainer extends ConsumerWidget {
  const TodoListViewContainer({super.key, required this.onEdit});

  final void Function(String id) onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTodoList = ref.watch(todoListProvider);

    return switch (asyncTodoList) {
      AsyncData(:final value) => TodoListView(
        key: key,
        todoList: value,
        onPressedEdit: onEdit,
        onPressedDelete: (todoId) {
          final notifier = ref.read(todoListProvider.notifier);
          notifier.delete(todoId);
        },
      ),
      _ => const LoadingView(),
    };
  }
}
