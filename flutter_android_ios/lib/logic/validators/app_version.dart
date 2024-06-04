import 'package:my_app/logic/types/app_update_policy.dart';
import 'package:my_app/logic/types/app_version_config.dart';
import 'package:my_app/logic/types/semantic_version.dart';
import 'package:my_app/logic/validators/semantic_version.dart';

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
