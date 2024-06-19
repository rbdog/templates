// Project imports:
import '../../logic/app_update_policy/types/app_version_config.dart';
import 'interface.dart';

class PrdRemoteConfig implements RemoteConfig {
  @override
  Future<AppVersionConfig> getAppVersionConfig() async {
    throw UnimplementedError();
  }
}
