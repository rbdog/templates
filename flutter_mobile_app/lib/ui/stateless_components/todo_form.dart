import 'package:flutter/material.dart';

import '../../logic/todo/index.dart';
import '../stateful_components/my_text_field.dart';
import '../theme/sizes.dart';
import 'gap.dart';
import 'status_button.dart';
import 'status_text.dart';

class TodoForm extends StatelessWidget {
  const TodoForm({
    super.key,
    required this.todo,
    required this.onEditStatus,
    required this.onEditText,
  });

  final Todo todo;
  final void Function() onEditStatus;
  final void Function(String newValue) onEditText;

  @override
  Widget build(BuildContext context) {
    /// ステータスボタン
    final statusButton = SizedBox(
      width: RawSize.p60,
      height: RawSize.p60,
      child: StatusButton(status: todo.status, onPressed: onEditStatus),
    );

    /// ステータス文字
    final statusText = StatusText(status: todo.status);

    /// テキスト編集フォーム
    final field = MyTextField(value: todo.text, onChanged: onEditText);

    return Container(
      padding: const EdgeInsets.all(RawSize.p8),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(flex: 1),
          Row(children: [statusButton, Gap.w(RawSize.p8), statusText]),
          Gap.h(RawSize.p20),
          field,
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
