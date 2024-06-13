// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../state/providers/user.dart';
import '../logger.dart';
import 'go_router.dart';
import 'page_path.dart';
import '../widgets/loading.dart';

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
            router.goNamed(PageId.signIn.name);
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
