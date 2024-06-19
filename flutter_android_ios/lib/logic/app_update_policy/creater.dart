// Project imports:
import '../semver/types/semver.dart';
import '../semver/validator.dart';
import 'types/app_update_policy.dart';
import 'types/app_ver_config.dart';

/// アプリのアップデートを判定するクラス
class AppUpdatePolicyCreater {
  const AppUpdatePolicyCreater();

  AppUpdatePolicy create({
    required AppVerConfig config,
    required Semver appVer,
  }) {
    /// 強制アップデートするべきか
    if (appVer < config.minSupported) {
      // 強制アップデートが必要
      return AppUpdatePolicy.force;
    }

    if (appVer < config.minRecommended) {
      // アップデートをおすすめ
      return AppUpdatePolicy.recommend;
    }

    /// 対応不要
    return AppUpdatePolicy.none;
  }
}
