// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../theme/colors.dart';

class MaintSoonBanner extends StatelessWidget {
  const MaintSoonBanner({
    super.key,
    required this.startAt,
    required this.endAt,
  });

  final DateTime startAt;
  final DateTime endAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: BrandColor.bananaYellow,
      alignment: Alignment.center,
      child: const Text('まもなくメンテナンスが始まります'),
    );
  }
}
