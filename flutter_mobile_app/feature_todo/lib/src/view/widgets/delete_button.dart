// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:feature_theme/feature_theme.dart';

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
