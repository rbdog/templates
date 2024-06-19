// Flutter imports:
import 'package:feature_router/feature_router.dart';
import 'package:feature_theme/feature_theme.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../state/editting_todo/provider.dart';
import '../dialogs/warn.dart';
import '../widgets/gap.dart';
import '../widgets/save_button.dart';
import '../widgets/status_button.dart';
import '../widgets/status_text.dart';
import '../widgets/text_field.dart';

/// 編集画面
class EditPage extends ConsumerWidget {
  const EditPage({
    super.key,
    required this.todoId,
  });

  final String todoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 編集中のTodo
    final edittingTodo = ref.watch(
      edittingTodoProvider(todoId),
    );

    /// ステータスボタン
    final statusButton = SizedBox(
      width: RawSize.p60,
      height: RawSize.p60,
      child: StatusButton(
        status: edittingTodo.status,
        onPressed: () {
          final notifier = ref.read(
            edittingTodoProvider(todoId).notifier,
          );
          notifier.editStatus();
        },
      ),
    );

    /// ステータス文字
    final statusText = StatusText(status: edittingTodo.status);

    /// テキスト編集フォーム
    final field = MyTextField(
      value: edittingTodo.text,
      onChanged: (value) {
        final notifier = ref.read(
          edittingTodoProvider(todoId).notifier,
        );
        notifier.editText(value);
      },
    );

    /// 保存ボタン
    final saveButton = SaveButton(
      onPressed: () {
        final notifier = ref.read(
          edittingTodoProvider(todoId).notifier,
        );
        notifier.save(
          onValidateFailure: () {
            // 失敗したらダイアログを表示
            showWarnDialog(
              context,
              context.l10n.textIsTooLong,
            );
          },
          onSuccess: () {
            // 成功したら前の画面に戻る
            final router = GoRouter.of(context);
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
        automaticallyImplyLeading: true,
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
