// Flutter imports:
import 'package:feature_app_update/feature_app_update.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_todo/feature_todo.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../state/providers/app_init_result.dart';

/// スプラッシュ画面
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initResult = ref.watch(appInitResultProvider);

    switch (initResult) {
      case AsyncData():
        return VersionUpdaterShell(
          child: SignedInShell(
            builder: (user) {
              return const HomePage();
            },
          ),
        );
      case AsyncError():
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('エラー画面'),
          ),
          body: const Center(
            child: FlutterLogo(size: 100),
          ),
        );
      default:
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('スプラッシュ画面'),
          ),
          body: const Center(
            child: FlutterLogo(size: 100),
          ),
        );
    }
  }
}
