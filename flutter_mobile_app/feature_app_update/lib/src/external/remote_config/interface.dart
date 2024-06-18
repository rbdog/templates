// Project imports:
import '../../logic/types/appver_config.dart';

/// Firebase Remote Config
abstract interface class RemoteConfig {
  /// 利用可能なアプリバージョンを取得
  Future<AppverConfig> getAppVersionConfig();
}
