// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../logic/todo/types/todo.dart';
import '../theme/sizes.dart';
import 'todo_card.dart';

/// Todo一覧
class TodoListView extends StatelessWidget {
  const TodoListView({
    super.key,
    required this.todoList,
    required this.onPressedEdit,
    required this.onPressedDelete,
  });

  final List<Todo> todoList;
  final void Function(String todoId) onPressedEdit;
  final void Function(String todoId) onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(RawSize.p4),
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final todo = todoList[index];
          return TodoCard(
            todo: todoList[index],
            onPressed: () => onPressedEdit(todo.id),
            onPressedDelete: () => onPressedDelete(todo.id),
          );
        },
      ),
    );
  }
}
