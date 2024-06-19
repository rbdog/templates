// Flutter imports:
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('スプラッシュ画面'),
      ),
      body: const Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
