import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/sign_in_with.dart';
import 'package:my_app/state/di/external.dart';
import 'package:my_app/state/providers/user.dart';
import 'package:my_app/view/logger.dart';
import 'package:my_app/view/router/go_router.dart';
import 'package:my_app/view/router/page_path.dart';

/// サインイン画面
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ログ
    viewLogger.info('サインイン画面をビルドします');

    // ユーザーを監視
    ref.listen(userProvider, (_, u) {
      switch (u) {
        case AsyncData(:final value):
          if (value != null) {
            viewLogger.info('サインインを検知しました');
            viewLogger.info('ホーム画面へ移動します');
            final router = ref.read(goRouterProvider);
            router.goNamed(PageId.home.routeName);
          }
          break;
        default:
          break;
      }
    });

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
