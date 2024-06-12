import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/app_update_policy.dart';
import 'package:my_app/state/providers/app_update_policy.dart';
import 'package:my_app/view/dialogs/recommend_update.dart';
import 'package:my_app/view/dialogs/force_update.dart';
import 'package:my_app/view/logger.dart';

/// アプリアップデートの監視
class VersionUpdaterShell extends ConsumerWidget {
  const VersionUpdaterShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      appUpdatePolicyProvider,
      (_, asyncPolicy) {
        final policy = asyncPolicy.value;
        if (policy == null) return;
        switch (policy) {
          case AppUpdatePolicy.none:
            // DO NOTHING
            break;
          case AppUpdatePolicy.force:
            viewLogger.info('アップデート強制を検知しました');
            showForceUpdateDialog(context);
            break;
          case AppUpdatePolicy.recommend:
            viewLogger.info('アップデートおすすめを検知しました');
            showRecommendUpdateDialog(context);
            break;
        }
      },
    );
    return child;
  }
}
