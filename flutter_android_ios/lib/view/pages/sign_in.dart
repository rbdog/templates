// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/auth/provider.dart';
import '../../logic/auth_cert/types/sign_in_with.dart';
import '../logger.dart';

/// サインイン画面
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ログ
    viewLogger.info('サインイン画面をビルドします');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('サインイン画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                final auth = ref.read(authProvider);
                auth.signIn(SignInWith.google);
              },
              child: const Text('Googleでサインイン'),
            ),
            ElevatedButton(
              onPressed: () {
                final auth = ref.read(authProvider);
                auth.signIn(SignInWith.apple);
              },
              child: const Text('Appleでサインイン'),
            ),
          ],
        ),
      ),
    );
  }
}
