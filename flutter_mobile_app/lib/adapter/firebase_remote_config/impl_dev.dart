import '../../logic/debug/index.dart';
import '../../logic/support/index.dart';
import 'dto.dart' as models;
import 'interface.dart';

class ImplDev implements FirebaseRemoteConfig {
  const ImplDev({required this.logger});

  final Logger logger;

  @override
  Future<AppVerConfig> getAppVerConfig() async {
    logger.info('最新のアプリバージョンを取得開始します');

    await Future.delayed(const Duration(seconds: 1));

    const dtoConfig = models.DtoAppVerConfig(
      latest: '1.0.0',
      yellow_line: '0.1.0',
      red_line: '0.0.1',
    );

    logger.info('最新のアプリバージョンを取得完了しました');

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

    final dtoConfig = models.DtoAppMaintConfig(
      plan: models.DtoAppMaintPlan(
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
