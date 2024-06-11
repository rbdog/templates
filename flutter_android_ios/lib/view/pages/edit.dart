import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/state/notifiers/logger.dart';
import 'package:my_app/state/providers/editting_todo.dart';
import 'package:my_app/view/theme/l10n.dart';
import 'package:my_app/view/theme/colors.dart';
import 'package:my_app/view/theme/sizes.dart';
import 'package:my_app/view/widgets/gap.dart';
import 'package:my_app/view/widgets/save_button.dart';
import 'package:my_app/view/widgets/status_button.dart';
import 'package:my_app/view/widgets/text_field.dart';
import 'package:my_app/view/widgets/status_text.dart';
import 'package:my_app/view/dialogs/warn.dart';
import 'package:my_app/view/router/go_router.dart';

/// 編集画面
class EditPage extends ConsumerWidget {
  const EditPage({
    super.key,
    required this.todoId,
  });

  final String todoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ログ
    logger.info('Todo編集画面をビルドします');

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
