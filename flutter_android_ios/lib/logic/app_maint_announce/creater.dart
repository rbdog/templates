// Project imports:
import 'types/app_maint_announce.dart';
import 'types/app_maint_config.dart';

/// アプリのメンテナンスを判定するクラス
class AppMaintAnnounceCreater {
  const AppMaintAnnounceCreater();

  AppMaintAnnounce create({
    required AppMaintConfig config,
    required DateTime now,
  }) {
    switch (config) {
      case AppMaintConfigNoPlan():
        return AppMaintAnnounceNone();
      case AppMaintConfigWithPlan(:final plan):
        // メンテナンス前
        final isBeforeMaint = now.isBefore(plan.startAt);
        // もうすぐ
        final isNear =
            plan.startAt.difference(now) < const Duration(minutes: 15);
        // メンテナンス中
        final isMiddleMaint = now.isAfter(plan.startAt);

        if (isBeforeMaint && isNear) {
          return AppMaintAnnounceSoon(
            startAt: plan.startAt,
            endAt: plan.endAt,
          );
        } else if (isMiddleMaint) {
          return AppMaintAnnounceInProgress(
            startAt: plan.startAt,
            endAt: plan.endAt,
          );
        } else {
          return AppMaintAnnounceNone();
        }
    }
  }
}
