import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/state/notifiers/logger.dart';
import 'package:my_app/logic/types/app_update_urgency.dart';
import 'package:my_app/state/providers/app_update_action.dart';
import 'package:my_app/view/dialogs/recommend_update.dart';
import 'package:my_app/view/dialogs/force_update.dart';

/// アプリアップデートの監視
class VersionUpdaterView extends ConsumerWidget {
  const VersionUpdaterView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      appUpdateUrgencyProvider,
      (_, asyncAction) {
        final action = asyncAction.value;
        if (action != null) {
          // 実行するべきアクションが存在
          switch (action) {
            case AppUpdateUrgency.none:
              // DO NOTHING
              break;
            case AppUpdateUrgency.force:
              logger.info('アップデート強制を検知しました');
              showForceUpdateDialog(context);
              break;
            case AppUpdateUrgency.recommend:
              logger.info('アップデートおすすめを検知しました');
              showRecommendUpdateDialog(context);
              break;
          }
        }
      },
    );
    return child;
  }
}
