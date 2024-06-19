// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../state/splash_completed/provider.dart';
import '../widgets/error.dart';
import '../widgets/splash.dart';

/// スプラッシュが完了しないと見れない画面範囲
class SplashCompletedShell extends ConsumerWidget {
  const SplashCompletedShell({
    super.key,
    required this.builder,
  });

  final Widget Function() builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initResult = ref.watch(splashCompletedProvider);

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
