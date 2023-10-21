import 'package:flutter/material.dart';
import 'package:my_app/view/theme/l10n.dart';
import 'package:my_app/view/theme/colors.dart';
import 'package:my_app/view/theme/fonts.dart';
import 'package:my_app/view/theme/sizes.dart';

/// カスタムダイアログ 任意アップデート用
class FrexibleUpdateDialog extends StatelessWidget {
  const FrexibleUpdateDialog({
    super.key,
    required this.onPressedOk,
  });

  final VoidCallback onPressedOk;

  @override
  Widget build(BuildContext context) {
    final messageArea = Expanded(
      child: Container(
        padding: const EdgeInsets.all(RawSize.p4),
        alignment: Alignment.center,
        child: const Text(
          '任意でアップデートしてください',
          style: BrandText.bodyM,
          maxLines: 5,
        ),
      ),
    );

    final buttonArea = SizedBox(
      width: double.infinity,
      height: RawSize.p40,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: BrandColor.bananaYellow,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
        onPressed: onPressedOk,
        child: Text(
          context.l10n.ok,
          style: BrandText.titleS.copyWith(
            color: BrandColor.white,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: BrandColor.bananaYellow,
              width: RawSize.p4,
            ),
            borderRadius: BorderRadius.circular(RawSize.p8),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              messageArea,
              buttonArea,
            ],
          ),
        ),
      ),
    );
  }
}

void showFrexibleUpdateDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return FrexibleUpdateDialog(
        onPressedOk: () {
          Navigator.of(context).pop();
        },
      );
    },
  );
}
