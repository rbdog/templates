// Flutter imports:
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final icon = isLoading
        ? const CircularProgressIndicator()
        : const FlutterLogo(size: 100);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('スプラッシュ画面'),
      ),
      body: Center(
        child: icon,
      ),
    );
  }
}
