// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/app_pkg/provider.dart';
import '../../logic/types/app_update_policy.dart';
import '../../logic/app_update_policy/validator.dart';
import '../../external/remote_config/provider.dart';

/// アプリアップデート対応
class AppUpdatePolicyNotifier extends AsyncNotifier<AppUpdatePolicy> {
  @override
  Future<AppUpdatePolicy> build() async {
    return _getUrgency();
  }

  /// 最新バージョン情報を取得
  Future<AppUpdatePolicy> _getUrgency() async {
    /// 利用可能なアプリバージョンを取得
    final remoteConfig = ref.read(remoteConfigProvider);
    final config = await remoteConfig.getAppVersionConfig();

    /// このアプリのバージョンを取得
    final appPkg = ref.read(appPkgProvider);
    final appVersion = await appPkg.getVersion();

    /// 2つの情報を比較
    const validator = AppUpdatePolicyValidator();
    final policy = validator.validate(
      config: config,
      appVersion: appVersion,
    );
    return policy;
  }

  /// 最新バージョン情報を取得して 反映
  Future<void> fetchUrgency() async {
    final urgency = await _getUrgency();
    state = AsyncData(urgency);
  }
}
