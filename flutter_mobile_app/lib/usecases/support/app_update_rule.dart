import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/support/index.dart';
import '../../di.dart';

class AppUpdatePolicyNotifier extends AsyncNotifier<AppUpdateRule> {
  @override
  Future<AppUpdateRule> build() async {
    return _getPolicy();
  }

  /// 最新バージョン情報を取得
  Future<AppUpdateRule> _getPolicy() async {
    /// 利用可能なアプリバージョンを取得
    final remoteConfig = ref.read(firebaseRemoteConfigProvider);
    final config = await remoteConfig.getAppVerConfig();

    /// このアプリのバージョンを取得
    final appInfo = ref.read(appInfoProvider);
    final appVer = await appInfo.getVer();

    /// 2つの情報を比較
    const validator = AppUpdateRuleCreator();
    final policy = validator.create(config: config, appVer: appVer);
    return policy;
  }
}
