// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/app_package/provider.dart';
import '../../external/remote_config/provider.dart';
import '../../logic/app_update_policy/creater.dart';
import '../../logic/app_update_policy/types/app_update_policy.dart';

class AppUpdatePolicyNotifier extends AsyncNotifier<AppUpdatePolicy> {
  @override
  Future<AppUpdatePolicy> build() async {
    return _getPolicy();
  }

  /// 最新バージョン情報を取得
  Future<AppUpdatePolicy> _getPolicy() async {
    /// 利用可能なアプリバージョンを取得
    final remoteConfig = ref.read(remoteConfigProvider);
    final config = await remoteConfig.getAppVersionConfig();

    /// このアプリのバージョンを取得
    final appPackage = ref.read(appPackageProvider);
    final appVersion = await appPackage.getAppVersion();

    /// 2つの情報を比較
    const validator = AppUpdatePolicyCreater();
    final policy = validator.create(
      config: config,
      appVersion: appVersion,
    );
    return policy;
  }
}
