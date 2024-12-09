// Flutter imports:
import 'package:flutter/material.dart';

/// 品質の悪いプログラムによってエラーが起こったときの画面
/// このエラーは修正できる可能性が高いです
class ErrorBadProgramPage extends StatelessWidget {
  const ErrorBadProgramPage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }
}
