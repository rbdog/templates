import 'package:flutter/material.dart';

import '../../logic/todo/index.dart';
import '../theme/fonts.dart';
import '../theme/l10n.dart';

/// ステータス文字
class StatusText extends StatelessWidget {
  const StatusText({
    super.key,
    required this.status,
    this.style = BrandTextStyle.titleL,
  });

  /// ステータス
  final Status status;

  /// 文字スタイル
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final string = switch (status) {
      Status.todo => context.l10n.statusTodo,
      Status.doing => context.l10n.statusDoing,
      Status.done => context.l10n.statusDone,
    };
    return Text(string, style: style);
  }
}
