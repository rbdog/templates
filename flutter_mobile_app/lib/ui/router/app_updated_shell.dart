import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/debug/index.dart';
import '../../logic/support/index.dart';
import '../../state/debug/provider.dart';
import '../../state/di/adapters.dart';
import '../../state/support/provider.dart';
import '../dialogs/force_update.dart';
import '../pages/error_unknown.dart';
import '../stateless_components/splash_view.dart';

/// 新しいアプリを使うことを保証するシェル
class AppUpdatedShell extends ConsumerWidget {
  const AppUpdatedShell({super.key, required this.builder});

  final Widget Function(bool recommendUpdate) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRule = ref.watch(appUpdateRuleProvider);

    switch (asyncRule) {
      case AsyncData(:final value):
        switch (value) {
          case AppUpdateRule.none:
            return builder(false);

          case AppUpdateRule.recommend:
            return builder(true);

          case AppUpdateRule.force:
            return Stack(
              alignment: Alignment.center,
              children: [
                const SplashView(isLoading: true),
                ForceUpdateDialog(
                  onPressedOk: () async {
                    final logger = ref.read(loggerProvider(Layer.ui));
                    logger.info('強制アップデート案内');
                    final store = ref.read(appStoreProvider);
                    await store.open();
                  },
                ),
              ],
            );
        }
      case AsyncError(:final error, :final stackTrace):
        return ErrorUnknownPage(error: error, stackTrace: stackTrace);
      default:
        return const SplashView(isLoading: true);
    }
  }
}
