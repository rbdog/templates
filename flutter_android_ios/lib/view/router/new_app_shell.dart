// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/app_update_policy/types/app_update_policy.dart';
import '../../state/app_update_policy/provider.dart';
import '../dialogs/force_update.dart';
import '../dialogs/recommend_update.dart';
import '../logger.dart';

/// 新しいアプリを使うことを保証するシェル
class NewAppShell extends ConsumerWidget {
  const NewAppShell({
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
