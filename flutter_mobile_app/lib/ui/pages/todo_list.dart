import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/debug/index.dart';
import '../../state/debug/provider.dart';
import '../../state/todo/provider.dart';
import '../containers/todo_list_view.dart';
import '../router/go_router.dart';
import '../stateless_components/add_button.dart';
import '../theme/colors.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.read(loggerProvider(Layer.ui));
    logger.info('ホーム画面をビルドします');

    /// 画面レイアウト
    return Scaffold(
      backgroundColor: BrandColor.pageBackground,
      appBar: AppBar(title: const Text('ホーム画面')),
      floatingActionButton: AddButton(
        onPressed: () async {
          // ユースケースを呼び出す
          final usecase = ref.read(todoListProvider.notifier);
          await usecase.add();
        },
      ),
      body: TodoListViewContainer(
        onEdit: (id) {
          final router = ref.read(goRouterProvider);
          router.push('/todos/$id/edit');
        },
      ),
    );
  }
}
