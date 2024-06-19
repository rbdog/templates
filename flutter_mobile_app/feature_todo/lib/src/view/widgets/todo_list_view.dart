import 'package:feature_theme/feature_theme.dart';
import 'package:flutter/material.dart';

import '../../logic/types/todo.dart';
import 'todo_card.dart';

/// Todo一覧
class TodoListView extends StatelessWidget {
  const TodoListView({
    super.key,
    required this.todos,
    required this.onPressedEdit,
    required this.onPressedDelete,
  });

  final List<Todo> todos;

  /// コールバック 編集
  final void Function(String todoId) onPressedEdit;

  /// コールバック 削除
  final void Function(String todoId) onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(RawSize.p4),
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return TodoCard(
            todo: todos[index],
            onPressedEdit: () => onPressedEdit(todo.id),
            onPressedDelete: () => onPressedDelete(todo.id),
          );
        },
      ),
    );
  }
}
