// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../state/providers/app_init_result.dart';
import '../pages/error.dart';

/// スプラッシュ画面
class SplashShell extends ConsumerWidget {
  const SplashShell({
    super.key,
    required this.builder,
  });

  /// 初期化が終わったら表示する画面
  final Widget Function() builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initResult = ref.watch(appInitResultProvider);

    switch (initResult) {
      case AsyncData():
        return builder();
      case AsyncError(:final error, :final stackTrace):
        return ErrorPage(
          error: error,
          stackTrace: stackTrace,
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
