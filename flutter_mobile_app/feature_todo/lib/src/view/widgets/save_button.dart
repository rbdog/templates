// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:feature_theme/feature_theme.dart';
import 'gap.dart';

/// 保存ボタン
class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.onPressed,
  });

  /// コールバック
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    /// アイコン
    const icon = Icon(Icons.check);

    /// 文字
    final text = Text(
      context.l10n.save,
      style: BrandTextStyle.bodyL,
    );

    /// レイアウト
    return FloatingActionButton.extended(
      heroTag: null,
      backgroundColor: BrandColor.bananaYellow,
      onPressed: onPressed,
      label: Row(
        children: [
          icon,
          Gap.w(RawSize.p8),
          text,
        ],
      ),
    );
  }
}
