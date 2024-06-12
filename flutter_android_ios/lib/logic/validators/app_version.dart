// Project imports:
import '../types/app_update_policy.dart';
import '../types/app_version_config.dart';
import '../types/semantic_version.dart';
import 'semantic_version.dart';

/// アプリのアップデートを判定するクラス
class AppVersionValidator {
  const AppVersionValidator();

  AppUpdatePolicy validate({
    required AppVersionConfig config,
    required SemanticVersion appVersion,
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
