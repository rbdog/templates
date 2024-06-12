import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/todo.dart';
import 'package:my_app/state/providers/todo_list.dart';
import 'package:my_app/view/logger.dart';
import 'package:my_app/view/router/page_path.dart';
import 'package:my_app/view/router/go_router.dart';
import 'package:my_app/view/widgets/add_button.dart';
import 'package:my_app/view/widgets/loading.dart';
import 'package:my_app/view/widgets/todo_card.dart';
import 'package:my_app/view/theme/sizes.dart';

/// ホーム画面
class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ログ
    viewLogger.info('ホーム画面をビルドします');

    /// Todo一覧
    final asyncTodoList = ref.watch(todoListProvider);
    final todoList = asyncTodoList;

    /// 追加ボタン
    /// Todo取得前は非表示
    final addButton = todoList.value == null
        ? null
        : AddButton(
            onPressed: () {
              // ユースケースを呼び出す
              final usecase = ref.read(todoListProvider.notifier);
              usecase.add();
            },
          );

    /// body
    final body = switch (asyncTodoList) {
      AsyncData(:final value) => _ListView(key: key, todoList: value),
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

/// Todo一覧
class _ListView extends ConsumerWidget {
  const _ListView({
    super.key,
    required this.todoList,
  });

  final List<Todo> todoList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(RawSize.p4),
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final todo = todoList[index];
          return TodoCard(
            todo: todoList[index],
            onPressed: () {
              // 編集画面へ進む
              final router = ref.read(goRouterProvider);
              router.pushNamed(
                PageId.edit.routeName,
                pathParameters: {'id': todo.id},
              );
            },
            onPressedDelete: () {
              // ユースケースを呼び出す
              final usecase = ref.read(todoListProvider.notifier);
              usecase.delete(todo.id);
            },
          );
        },
      ),
    );
  }
}
