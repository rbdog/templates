import 'package:flutter/material.dart';

class MaintPage extends StatelessWidget {
  const MaintPage({
    super.key,
    required this.endAt,
  });

  final DateTime endAt;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('現在メンテナンス中です'),
      ),
    );
  }
}
