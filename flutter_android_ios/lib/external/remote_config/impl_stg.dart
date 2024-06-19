// Project imports:
import '../../logic/app_update_policy/types/app_ver_config.dart';
import 'interface.dart';

class StgRemoteConfig implements RemoteConfig {
  @override
  Future<AppVerConfig> getAppVerConfig() async {
    throw UnimplementedError();
  }
}
