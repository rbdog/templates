import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/todo/index.dart';
import '../stateless_components/error_retry_view.dart';
import '../stateless_components/todo_form.dart';

class TodoFormContainer extends ConsumerWidget {
  const TodoFormContainer({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTodo = ref.watch(todoProvider(id));

    return switch (asyncTodo) {
      AsyncData(value: final todo) => TodoForm(
        todo: todo,
        onEditStatus: () async {
          final usecase = ref.read(todoListProvider.notifier);
          await usecase.editStatus(id);
        },
        onEditText: (newValue) async {
          final usecase = ref.read(todoListProvider.notifier);
          await usecase.editText(id, newValue);
        },
      ),
      AsyncError(:final error) => ErrorRetryView(error: error),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
