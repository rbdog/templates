// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/auth_cert/types/auth_cert.dart';
import '../../state/auth_cert/provider.dart';
import '../pages/sign_in.dart';

/// サインイン限定の画面範囲
class SignedInShell extends ConsumerWidget {
  const SignedInShell({
    super.key,
    required this.builder,
  });

  final Widget Function(AuthCert cert) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCert = ref.watch(authCertProvider);

    switch (asyncCert) {
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
