// Project imports:
import '../../logic/types/app_version_config.dart';

/// Firebase Remote Config
abstract interface class RemoteConfig {
  /// 利用可能なアプリバージョンを取得
  Future<AppVersionConfig> getAppVersionConfig();
}
