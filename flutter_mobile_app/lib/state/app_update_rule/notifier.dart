// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../adapter/app_pkg/provider.dart';
import '../../adapter/remote_config/provider.dart';
import '../../logic/app_update/creator.dart';
import '../../logic/app_update/types/app_update_rule.dart';

class AppUpdatePolicyNotifier extends AsyncNotifier<AppUpdateRule> {
  @override
  Future<AppUpdateRule> build() async {
    return _getPolicy();
  }

  /// 最新バージョン情報を取得
  Future<AppUpdateRule> _getPolicy() async {
    /// 利用可能なアプリバージョンを取得
    final remoteConfig = ref.read(remoteConfigProvider);
    final config = await remoteConfig.getAppVerConfig();

    /// このアプリのバージョンを取得
    final appPkg = ref.read(appPkgProvider);
    final appVer = await appPkg.getVer();

    /// 2つの情報を比較
    const validator = AppUpdateRuleCreator();
    final policy = validator.create(config: config, appVer: appVer);
    return policy;
  }
}
