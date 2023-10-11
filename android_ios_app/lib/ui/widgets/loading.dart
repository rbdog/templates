import 'package:flutter/material.dart';

/// 読み込み中
class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}
