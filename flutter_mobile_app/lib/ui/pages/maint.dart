import 'package:flutter/material.dart';

import '../theme/colors.dart';

class MaintPage extends StatelessWidget {
  const MaintPage({super.key, required this.endAt});

  final DateTime endAt;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: BrandColor.pageBackground,
      body: Center(child: Text('現在メンテナンス中です')),
    );
  }
}
