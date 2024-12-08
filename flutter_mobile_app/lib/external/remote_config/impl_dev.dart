// Project imports:
import '../../logic/app_maint_announce/types/app_maint_config.dart';
import '../../logic/app_update_policy/types/app_ver_config.dart';
import '../../logic/semver/converter.dart';
import '../logger.dart';
import 'interface.dart';
import 'models.dart' as models;

class ImplDev implements RemoteConfig {
  @override
  Future<AppVerConfig> getAppVerConfig() async {
    externalLogger.info('最新のアプリバージョンを取得開始します');

    await Future.delayed(const Duration(seconds: 1));

    const res = models.AppVerConfig(
      latest: '1.0.0',
      yellow_line: '0.1.0',
      red_line: '0.0.1',
    );

    externalLogger.info('最新のアプリバージョンを取得完了しました');

    final converter = SemverConverter();
    final latest = converter.fromString(res.latest);
    final minRecommended = converter.fromString(res.yellow_line);
    final minSupported = converter.fromString(res.red_line);

    return AppVerConfig(
      latest: latest,
      yellowLine: minRecommended,
      redLine: minSupported,
    );
  }

  @override
  Future<AppMaintConfig> getAppMaintConfig() async {
    await Future.delayed(const Duration(seconds: 1));

    final now = DateTime.now();
    final tenMinutesLater = now.add(const Duration(minutes: 10));
    final threeHoursLater = now.add(const Duration(hours: 3));

    final res = models.AppMaintConfig(
      plan: models.AppMaintPlan(
        start_at: tenMinutesLater.toIso8601String(),
        end_at: threeHoursLater.toIso8601String(),
      ),
    );

    if (res.plan == null) {
      return AppMaintConfigNoPlan();
    } else {
      final resPlan = res.plan!;
      final startAt = DateTime.parse(resPlan.start_at);
      final endAt = DateTime.parse(resPlan.end_at);
      final plan = AppMaintPlan(startAt: startAt, endAt: endAt);
      return AppMaintConfigWithPlan(plan: plan);
    }
  }
}
