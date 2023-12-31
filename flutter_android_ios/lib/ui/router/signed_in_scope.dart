import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/features/logger.dart';
import 'package:my_app/runner/providers/user.dart';
import 'package:my_app/ui/router/go_router.dart';
import 'package:my_app/ui/router/page_path.dart';
import 'package:my_app/ui/widgets/loading.dart';

/// サインイン限定の画面範囲
class SignedInScope extends ConsumerWidget {
  const SignedInScope({
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
            logger.info('サインアウトを検知しました');
            logger.info('サインイン画面へ移動します');
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
