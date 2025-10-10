// Project imports:
import '../semver/types/semver.dart';
import '../semver/validator.dart';
import 'types/app_update_rule.dart';
import 'types/app_ver_config.dart';

/// アプリのアップデートを判定するクラス
class AppUpdateRuleCreator {
  const AppUpdateRuleCreator();

  AppUpdateRule create({required AppVerConfig config, required Semver appVer}) {
    /// 強制アップデートするべきか
    if (appVer < config.redLine) {
      // 強制アップデートが必要
      return AppUpdateRule.force;
    }

    if (appVer < config.yellowLine) {
      // アップデートをおすすめ
      return AppUpdateRule.recommend;
    }

    /// 対応不要
    return AppUpdateRule.none;
  }
}
