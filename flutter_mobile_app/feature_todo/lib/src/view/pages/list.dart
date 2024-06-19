// Flutter imports:
import 'package:feature_router/feature_router.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../state/providers/todo_list.dart';
import '../widgets/add_button.dart';
import '../widgets/loading.dart';
import '../widgets/todo_list_view.dart';

/// 一覧画面
class ListPage extends ConsumerWidget {
  const ListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Todo一覧
    final asyncTodoList = ref.watch(todoListProvider);

    /// 追加ボタン
    final addButton = switch (asyncTodoList) {
      AsyncData() => AddButton(
          onPressed: () {
            // ユースケースを呼び出す
            final usecase = ref.read(todoListProvider.notifier);
            usecase.add();
          },
        ),
      _ => null,
    };

    /// body
    final body = switch (asyncTodoList) {
      AsyncData(:final value) => TodoListView(
          key: key,
          todos: value,
          onPressedEdit: (todoId) {
            // 編集画面へ進む
            final router = GoRouter.of(context);
            router.pushNamed(
              PageId.edit.name,
              pathParameters: {'id': todoId},
            );
          },
          onPressedDelete: (todoId) {
            // ユースケースを呼び出す
            final usecase = ref.read(todoListProvider.notifier);
            usecase.delete(todoId);
          },
        ),
      _ => const LoadingView(),
    };

    /// 画面レイアウト
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('ホーム画面'),
      ),
      floatingActionButton: addButton,
      body: body,
    );
  }
}
