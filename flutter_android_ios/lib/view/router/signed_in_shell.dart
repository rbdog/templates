// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/credential/types/credential.dart';
import '../../state/credential/provider.dart';
import '../pages/sign_in.dart';
import '../widgets/splash.dart';

/// サインイン限定の画面範囲
class SignedInShell extends ConsumerWidget {
  const SignedInShell({
    super.key,
    required this.builder,
  });

  final Widget Function(Credential credential) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCredential = ref.watch(credentialProvider);

    switch (asyncCredential) {
      case AsyncData(:final value):
        if (value == null) {
          return const SignInPage();
        } else {
          return builder(value);
        }
      default:
        return const Splash(isLoading: true);
    }
  }
}
