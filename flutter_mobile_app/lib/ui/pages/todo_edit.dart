import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/debug/index.dart';
import '../../state/debug/provider.dart';
import '../../state/todo/provider.dart';
import '../containers/todo_form.dart';
import '../dialogs/warn.dart';
import '../router/go_router.dart';
import '../stateless_components/save_button.dart';
import '../theme/colors.dart';
import '../theme/l10n.dart';

/// 編集画面
class TodoEditPage extends ConsumerWidget {
  const TodoEditPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.read(loggerProvider(Layer.ui));
    logger.info('Todo編集画面をビルドします');

    /// 保存ボタン
    final saveButton = SaveButton(
      onPressed: () async {
        // ユースケースを呼び出す
        final usecase = ref.read(todoListProvider.notifier);
        await usecase.save(
          id: id,
          onValidateFailure: () {
            // 失敗したらダイアログを表示
            showWarnDialog(context, context.l10n.textIsTooLong);
          },
          onSuccess: () {
            // 成功したら前の画面に戻る
            final router = ref.read(goRouterProvider);
            router.pop();
          },
        );
      },
    );

    /// 画面レイアウト
    return Scaffold(
      backgroundColor: BrandColor.pageBackground,
      appBar: AppBar(title: const Text('編集画面')),
      floatingActionButton: saveButton,
      body: TodoFormContainer(id: id),
    );
  }
}
