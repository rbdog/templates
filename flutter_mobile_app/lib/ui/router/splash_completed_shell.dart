import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/support/provider.dart';
import '../pages/error_unknown.dart';
import '../stateless_components/splash_view.dart';

/// スプラッシュが完了しないと見れない画面範囲
class SplashCompletedShell extends ConsumerWidget {
  const SplashCompletedShell({super.key, required this.builder});

  final Widget Function() builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completed = ref.watch(splashCompletedProvider);

    switch (completed) {
      case AsyncData():
        return builder();
      case AsyncError(:final error, :final stackTrace):
        return ErrorUnknownPage(error: error, stackTrace: stackTrace);
      default:
        return const SplashView(isLoading: true);
    }
  }
}
