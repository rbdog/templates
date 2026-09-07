import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/auth/index.dart';
import '../../domain/debug/index.dart';
import '../../usecases/debug/provider.dart';
import '../../usecases/auth/index.dart';
import '../theme/colors.dart';

/// サインイン画面
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logger = ref.read(loggerProvider(Layer.ui));
    logger.info('サインイン画面をビルドします');

    return Scaffold(
      backgroundColor: BrandColor.pageBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                await ref.read(signInProvider)(AuthProvider.google);
              },
              child: const Text('Googleでサインイン'),
            ),
            ElevatedButton(
              onPressed: () async {
                await ref.read(signInProvider)(AuthProvider.apple);
              },
              child: const Text('Appleでサインイン'),
            ),
          ],
        ),
      ),
    );
  }
}
