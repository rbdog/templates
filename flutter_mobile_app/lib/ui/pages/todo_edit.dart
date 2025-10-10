// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../state/editing_todo/provider.dart';
import '../dialogs/warn.dart';
import '../logger.dart';
import '../router/go_router.dart';
import '../theme/colors.dart';
import '../theme/l10n.dart';
import '../theme/sizes.dart';
import '../widgets/gap.dart';
import '../widgets/save_button.dart';
import '../widgets/status_button.dart';
import '../widgets/status_text.dart';
import '../widgets/text_field.dart';

/// 編集画面
class TodoEditPage extends ConsumerWidget {
  const TodoEditPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ログ
    viewLogger.info('Todo編集画面をビルドします');

    /// 編集中のTodo
    final todo = ref.watch(
      editingTodoProvider(id),
    );

    /// ステータスボタン
    final statusButton = SizedBox(
      width: RawSize.p60,
      height: RawSize.p60,
      child: StatusButton(
        status: todo.status,
        onPressed: () {
          // ユースケースを呼び出す
          final usecase = ref.read(
            editingTodoProvider(id).notifier,
          );
          usecase.editStatus();
        },
      ),
    );

    /// ステータス文字
    final statusText = StatusText(status: todo.status);

    /// テキスト編集フォーム
    final field = MyTextField(
      value: todo.text,
      onChanged: (value) {
        // ユースケースを呼び出す
        final usecase = ref.read(
          editingTodoProvider(id).notifier,
        );
        usecase.editText(value);
      },
    );

    /// 保存ボタン
    final saveButton = SaveButton(
      onPressed: () {
        // ユースケースを呼び出す
        final usecase = ref.read(
          editingTodoProvider(id).notifier,
        );
        usecase.save(
          onValidateFailure: () {
            // 失敗したらダイアログを表示
            showWarnDialog(
              context,
              context.l10n.textIsTooLong,
            );
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
      appBar: AppBar(
        backgroundColor: BrandColor.bananaYellow,
        title: const Text('編集画面'),
      ),
      floatingActionButton: saveButton,
      body: Container(
        padding: const EdgeInsets.all(RawSize.p8),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(flex: 1),
            Row(
              children: [
                statusButton,
                Gap.w(RawSize.p8),
                statusText,
              ],
            ),
            Gap.h(RawSize.p20),
            field,
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
