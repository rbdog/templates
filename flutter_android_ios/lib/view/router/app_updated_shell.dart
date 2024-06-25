// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/app_store/provider.dart';
import '../../logic/app_update_policy/types/app_update_policy.dart';
import '../../state/app_update_policy/provider.dart';
import '../dialogs/force_update.dart';
import '../logger.dart';
import '../widgets/error_unknown.dart';
import '../widgets/splash.dart';

/// 新しいアプリを使うことを保証するシェル
class AppUpdatedShell extends ConsumerWidget {
  const AppUpdatedShell({
    super.key,
    required this.builder,
  });

  final Widget Function(bool recommendUpdate) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPolicy = ref.watch(appUpdatePolicyProvider);

    switch (asyncPolicy) {
      case AsyncData(:final value):
        switch (value) {
          case AppUpdatePolicy.none:
            return builder(false);

          case AppUpdatePolicy.recommend:
            return builder(true);

          case AppUpdatePolicy.force:
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
        return ErrorUnknownPage(
          error: error,
          stackTrace: stackTrace,
        );
      default:
        return const Splash(isLoading: true);
    }
  }
}
