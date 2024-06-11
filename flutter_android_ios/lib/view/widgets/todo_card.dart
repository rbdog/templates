import 'package:flutter/material.dart';
import 'package:my_app/logic/types/todo.dart';
import 'package:my_app/view/theme/colors.dart';
import 'package:my_app/view/theme/fonts.dart';
import 'package:my_app/view/theme/sizes.dart';
import 'package:my_app/view/widgets/delete_button.dart';
import 'package:my_app/view/widgets/status_image.dart';

/// Todoカード
class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.todo,
    required this.onPressed,
    required this.onPressedDelete,
  });

  /// 表示するTodo
  final Todo todo;

  /// コールバック カード全体
  final VoidCallback onPressed;

  /// コールバック 削除
  final VoidCallback onPressedDelete;

  @override
  Widget build(BuildContext context) {
    /// ステータス表示エリア
    final statusLabel = Container(
      width: RawSize.p60,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(RawSize.p8),
      color: BrandColor.bananaYellow,
      child: StatusImage(status: todo.status),
    );

    /// Todoの文字を表示するエリア
    final textArea = Container(
      alignment: Alignment.centerLeft,
      child: Text(
        todo.text,
        textAlign: TextAlign.left,
        style: BrandTextStyle.bodyS,
        maxLines: 1,
      ),
    );

    /// ボタンを並べるエリア
    final actionsRow = Row(
      children: [
        const Spacer(),
        DeleteButton(onPressed: onPressedDelete),
      ],
    );

    /// レイアウト
    final layouts = SizedBox(
      height: RawSize.p90,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          statusLabel,
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(RawSize.p4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: textArea),
                  actionsRow,
                ],
              ),
            ),
          ),
        ],
      ),
    );

    /// タップを検知
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onPressed,
        child: layouts,
      ),
    );
  }
}
