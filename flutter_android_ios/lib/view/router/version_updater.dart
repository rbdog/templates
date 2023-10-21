import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/features/logger.dart';
import 'package:my_app/logic/types/app_update_action.dart';
import 'package:my_app/state/providers/app_update_action.dart';
import 'package:my_app/view/dialogs/frexible_update.dart';
import 'package:my_app/view/dialogs/immidiate_update.dart';

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
      appUpdateActionProvider,
      (_, asyncAction) {
        final action = asyncAction.value;
        if (action != null) {
          // 実行するべきアクションが存在
          switch (action) {
            case AppUpdateAction.none:
              // DO NOTHING
              break;
            case AppUpdateAction.showImmidiateUpdate:
              logger.info('強制アップデートを検知しました');
              showImmidiateUpdateDialog(context);
              break;
            case AppUpdateAction.showFrexibleUpdate:
              logger.info('任意アップデートを検知しました');
              showFrexibleUpdateDialog(context);
              break;
          }
        }
      },
    );
    return child;
  }
}
