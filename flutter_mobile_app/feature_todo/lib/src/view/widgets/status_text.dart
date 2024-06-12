// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../logic/types/status.dart';
import 'package:feature_theme/feature_theme.dart';

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
