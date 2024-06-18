// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/auth_user.dart';
import '../../state/providers/auth_user.dart';
import '../pages/sign_in.dart';

/// サインイン限定の画面範囲
class SignedInShell extends ConsumerWidget {
  const SignedInShell({
    super.key,
    required this.builder,
  });

  final Widget Function(AuthUser user) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ユーザー
    final asyncUser = ref.watch(authUserProvider);

    switch (asyncUser) {
      case AsyncData(:final value):
        if (value == null) {
          return const SignInPage();
        } else {
          return builder(value);
        }
      default:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}
