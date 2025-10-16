import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final icon = isLoading
        ? const CircularProgressIndicator()
        : const FlutterLogo(size: 100);

    return ColoredBox(
      color: Colors.orange,
      child: Center(child: icon),
    );
  }
}
