// Project imports:
import '../types/app_update_policy.dart';
import '../types/appver_config.dart';
import '../types/semver.dart';
import 'semver.dart';

/// アプリのアップデートを判定するクラス
class AppverConfigValidator {
  const AppverConfigValidator();

  AppUpdatePolicy validate({
    required AppverConfig config,
    required Semver appVersion,
  }) {
    /// 強制アップデートするべきか
    if (appVersion < config.minSupported) {
      // 強制アップデートが必要
      return AppUpdatePolicy.force;
    }

    if (appVersion < config.minRecommended) {
      // アップデートをおすすめ
      return AppUpdatePolicy.recommend;
    }

    /// 対応不要
    return AppUpdatePolicy.none;
  }
}
