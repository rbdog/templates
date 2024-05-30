import 'package:my_app/logic/types/available_app_version.dart';

/// Firebase Remote Config
abstract interface class RemoteConfig {
  /// 利用可能なアプリバージョンを取得
  Future<AvailableAppVersion> getAvailableAppVersion();
}
