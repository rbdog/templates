import 'package:flutter/material.dart';

class ErrorRetryView extends StatelessWidget {
  const ErrorRetryView({super.key, required this.error});

  final Object? error;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('エラーが発生しました. error: ${error.toString()}'),
    );
  }
}
