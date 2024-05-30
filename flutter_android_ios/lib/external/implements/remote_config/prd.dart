import 'package:my_app/external/interfaces/remote_config.dart';
import 'package:my_app/logic/types/available_app_version.dart';

/// prdフレーバー用の Firebase Remote Config
class PrdRemoteConfig implements RemoteConfig {
  @override
  Future<AvailableAppVersion> getAvailableAppVersion() async {
    return const AvailableAppVersion(
      latest: '0.0.0',
      old: '0.0.0',
      tooOld: '0.0.0',
    );
  }
}
