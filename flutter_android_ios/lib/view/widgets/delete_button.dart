import 'package:flutter/material.dart';
import 'package:my_app/view/theme/l10n.dart';
import 'package:my_app/view/theme/colors.dart';
import 'package:my_app/view/theme/fonts.dart';

/// 削除ボタン
class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.onPressed,
  });

  /// コールバック
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        context.l10n.delete,
        style: BrandTextStyle.bodyS.copyWith(
          color: BrandColor.dangerRed,
        ),
      ),
    );
  }
}
