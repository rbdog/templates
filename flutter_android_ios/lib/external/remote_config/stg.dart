import 'package:my_app/logic/interfaces/remote_config.dart';
import 'package:my_app/logic/types/available_app_version.dart';

/// stgフレーバー用の Firebase Remote Config
class StgRemoteConfig implements RemoteConfig {
  @override
  Future<AvailableAppVersion> getAvailableAppVersion() async {
    return const AvailableAppVersion(
      immediateUpdate: '0.0.0',
      flexibleUpdate: '0.0.0',
    );
  }
}
