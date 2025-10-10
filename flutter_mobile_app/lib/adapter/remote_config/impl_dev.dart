// Project imports:
import '../../logic/maint/types/app_maint_config.dart';
import '../../logic/app_update/types/app_ver_config.dart';
import '../../logic/semver/converter.dart';
import '../logger.dart';
import 'interface.dart';
import 'models.dart' as models;

class ImplDev implements RemoteConfig {
  @override
  Future<AppVerConfig> getAppVerConfig() async {
    externalLogger.info('最新のアプリバージョンを取得開始します');

    await Future.delayed(const Duration(seconds: 1));

    const dtoConfig = models.AppVerConfig(
      latest: '1.0.0',
      yellow_line: '0.1.0',
      red_line: '0.0.1',
    );

    externalLogger.info('最新のアプリバージョンを取得完了しました');

    final converter = SemverConverter();
    final latest = converter.fromString(dtoConfig.latest);
    final minRecommended = converter.fromString(dtoConfig.yellow_line);
    final minSupported = converter.fromString(dtoConfig.red_line);

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

    final dtoConfig = models.AppMaintConfig(
      plan: models.AppMaintPlan(
        start_at: tenMinutesLater.toIso8601String(),
        end_at: threeHoursLater.toIso8601String(),
      ),
    );

    if (dtoConfig.plan == null) {
      return AppMaintConfigNoPlan();
    } else {
      final resPlan = dtoConfig.plan!;
      final startAt = DateTime.parse(resPlan.start_at);
      final endAt = DateTime.parse(resPlan.end_at);
      final plan = AppMaintPlan(startAt: startAt, endAt: endAt);
      return AppMaintConfigWithPlan(plan: plan);
    }
  }
}
