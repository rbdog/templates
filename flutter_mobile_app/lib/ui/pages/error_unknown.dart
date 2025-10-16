import 'package:flutter/material.dart';

import '../theme/colors.dart';

/// 何が原因かわからないエラーが起こったときの画面
/// このエラーは修正できるかどうかわかりません
class ErrorUnknownPage extends StatelessWidget {
  const ErrorUnknownPage({
    super.key,
    required this.error,
    required this.stackTrace,
  });

  final Object error;
  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    final message = error.toString();

    return Scaffold(
      backgroundColor: BrandColor.pageBackground,
      appBar: AppBar(title: const Text('エラー画面')),
      body: Center(child: Text(message)),
    );
  }
}
