// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../theme/colors.dart';
import '../theme/fonts.dart';
import '../theme/l10n.dart';
import '../theme/sizes.dart';
import 'gap.dart';

/// 追加ボタン
class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onPressed,
  });

  /// コールバック
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    /// アイコン
    const icon = Icon(Icons.add);

    /// 文字
    final text = Text(
      context.l10n.createNew,
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
