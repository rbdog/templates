// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../state/app_init_result/provider.dart';
import '../widget/error.dart';
import '../widget/splash.dart';

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
        return const Splash();
    }
  }
}
