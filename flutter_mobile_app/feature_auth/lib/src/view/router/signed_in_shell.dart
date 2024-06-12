// Flutter imports:
import 'package:feature_user/feature_user.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../state/providers/user.dart';
import '../pages/sign_in.dart';

/// サインイン限定の画面範囲
class SignedInShell extends ConsumerWidget {
  const SignedInShell({
    super.key,
    required this.builder,
  });

  final Widget Function(User user) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ユーザー
    final asyncUser = ref.watch(userProvider);

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
