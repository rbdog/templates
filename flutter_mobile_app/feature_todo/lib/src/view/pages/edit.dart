// Flutter imports:
import 'package:feature_theme/feature_theme.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import '../../state/providers/editting_todo.dart';
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
    final todo = ref.watch(
      edittingTodoProvider(todoId),
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
            edittingTodoProvider(todoId).notifier,
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
          edittingTodoProvider(todoId).notifier,
        );
        usecase.editText(value);
      },
    );

    /// 保存ボタン
    final saveButton = SaveButton(
      onPressed: () {
        // ユースケースを呼び出す
        final usecase = ref.read(
          edittingTodoProvider(todoId).notifier,
        );
        usecase.save(
          onValidateFailure: () {
            // 失敗したらダイアログを表示
            showWarnDialog(
              context,
              context.l10n.tooLongTextMesage,
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
