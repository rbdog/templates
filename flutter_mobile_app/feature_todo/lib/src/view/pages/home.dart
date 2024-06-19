// Flutter imports:
import 'package:feature_router/feature_router.dart';
import 'package:feature_theme/feature_theme.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/todo.dart';
import '../../state/todo_list/provider.dart';
import '../widgets/add_button.dart';
import '../widgets/loading.dart';
import '../widgets/todo_card.dart';

/// ホーム画面
class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      AsyncData(:final value) => _ListView(
          key: key,
          todoList: value,
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
            onPressedEdit: () {
              // 編集画面へ進む
              final router = GoRouter.of(context);
              router.pushNamed(
                PageId.edit.name,
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
