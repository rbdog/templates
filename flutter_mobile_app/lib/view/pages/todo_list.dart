// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../state/todo_list/provider.dart';
import '../logger.dart';
import '../router/go_router.dart';
import '../router/page_path.dart';
import '../widgets/add_button.dart';
import '../widgets/loading.dart';
import '../widgets/todo_list_view.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ログ
    viewLogger.info('ホーム画面をビルドします');

    /// Todo一覧
    final asyncTodoList = ref.watch(todoListProvider);

    /// 追加ボタン
    /// Todo取得前は非表示
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
          todoList: value,
          onPressedEdit: (todoId) {
            // 編集画面へ進む
            final router = ref.read(goRouterProvider);
            router.pushNamed(
              PagePath.todoEdit.name,
              pathParameters: {'id': todoId},
            );
          },
          onPressedDelete: (todoId) {
            final notifier = ref.read(todoListProvider.notifier);
            notifier.delete(todoId);
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
