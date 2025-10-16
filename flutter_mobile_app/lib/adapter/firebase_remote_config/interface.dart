import '../../logic/support/index.dart';

/// Firebase Remote Config
abstract interface class FirebaseRemoteConfig {
  /// 利用可能なアプリバージョンを取得
  Future<AppVerConfig> getAppVerConfig();

  /// メンテナンス予定を取得
  Future<AppMaintConfig> getAppMaintConfig();
}
