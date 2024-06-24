// Project imports:
import '../../logic/app_maint_announce/types/app_maint_config.dart';
import '../../logic/app_update_policy/types/app_ver_config.dart';
import 'interface.dart';

class ImplStg implements RemoteConfig {
  @override
  Future<AppVerConfig> getAppVerConfig() async {
    throw UnimplementedError();
  }

  @override
  Future<AppMaintConfig> getAppMaintConfig() {
    throw UnimplementedError();
  }
}
