import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/auth/index.dart';
import '../../logic/debug/index.dart';
import '../../state/debug/provider.dart';
import '../../state/di/adapters.dart';
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
                final auth = ref.read(firebaseAuthProvider);
                await auth.signIn(AuthProvider.google);
              },
              child: const Text('Googleでサインイン'),
            ),
            ElevatedButton(
              onPressed: () async {
                final auth = ref.read(firebaseAuthProvider);
                await auth.signIn(AuthProvider.apple);
              },
              child: const Text('Appleでサインイン'),
            ),
          ],
        ),
      ),
    );
  }
}
