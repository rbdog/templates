import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/state/providers/user.dart';
import 'package:my_app/view/logger.dart';
import 'package:my_app/view/router/go_router.dart';
import 'package:my_app/view/router/page_path.dart';
import 'package:my_app/view/widgets/loading.dart';

/// サインイン限定の画面範囲
class SignedInShell extends ConsumerWidget {
  const SignedInShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ユーザー
    final asyncUser = ref.watch(userProvider);

    ref.listen(userProvider, (_, u) {
      switch (u) {
        case AsyncData(:final value):
          if (value == null) {
            viewLogger.info('サインアウトを検知しました');
            viewLogger.info('サインイン画面へ移動します');
            final router = ref.read(goRouterProvider);
            router.goNamed(PageId.signIn.routeName);
          }
          break;
        default:
          break;
      }
    });

    return switch (asyncUser) {
      AsyncData() => child,
      _ => const Scaffold(body: LoadingView()), // ぐるぐる
    };
  }
}
