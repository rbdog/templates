import 'package:flutter/material.dart';
import 'package:my_app/ui/theme/l10n.dart';
import 'package:my_app/ui/theme/colors.dart';
import 'package:my_app/ui/theme/fonts.dart';
import 'package:my_app/ui/theme/sizes.dart';
import 'package:my_app/ui/widgets/gap.dart';

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
      style: BrandText.bodyL,
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
