import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/auth/index.dart';
import '../../state/auth/provider.dart';
import '../pages/sign_in.dart';
import '../stateless_components/splash_view.dart';

/// サインイン限定の画面範囲
class SignedInShell extends ConsumerWidget {
  const SignedInShell({super.key, required this.builder});

  final Widget Function(SignInCredential credential) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCredential = ref.watch(signInCredentialProvider);

    switch (asyncCredential) {
      case AsyncData(:final value):
        if (value == null) {
          return const SignInPage();
        } else {
          return builder(value);
        }
      default:
        return const SplashView(isLoading: true);
    }
  }
}
