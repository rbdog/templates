import 'package:flutter/material.dart';
import 'package:my_app/logic/types/status.dart';
import 'package:my_app/view/theme/l10n.dart';
import 'package:my_app/view/theme/fonts.dart';

/// ステータス文字
class StatusText extends StatelessWidget {
  const StatusText({
    super.key,
    required this.status,
    this.style = BrandText.titleL,
  });

  /// ステータス
  final Status status;

  /// 文字スタイル
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      switch (status) {
        Status.todo => context.l10n.statusTodo,
        Status.doing => context.l10n.statusDoing,
        Status.done => context.l10n.statusDone,
      },
      style: style,
    );
  }
}
