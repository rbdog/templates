// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../adapter/app_store/provider.dart';
import '../../logic/app_update/types/app_update_rule.dart';
import '../../state/app_update_rule/provider.dart';
import '../dialogs/force_update.dart';
import '../logger.dart';
import '../widgets/error_unknown.dart';
import '../widgets/splash.dart';

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
                const Splash(isLoading: true),
                ForceUpdateDialog(
                  onPressedOk: () {
                    viewLogger.info('強制アップデート案内');
                    final store = ref.read(appStoreProvider);
                    store.open();
                  },
                ),
              ],
            );
        }
      case AsyncError(:final error, :final stackTrace):
        return ErrorUnknownPage(error: error, stackTrace: stackTrace);
      default:
        return const Splash(isLoading: true);
    }
  }
}
