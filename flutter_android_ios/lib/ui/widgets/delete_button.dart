import 'package:flutter/material.dart';
import 'package:my_app/ui/theme/l10n.dart';
import 'package:my_app/ui/theme/colors.dart';
import 'package:my_app/ui/theme/fonts.dart';

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
        style: BrandText.bodyS.copyWith(
          color: BrandColor.dangerRed,
        ),
      ),
    );
  }
}
