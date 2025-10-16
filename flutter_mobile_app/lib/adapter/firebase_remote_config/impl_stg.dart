import '../../logic/support/index.dart';
import 'interface.dart';

class ImplStg implements FirebaseRemoteConfig {
  @override
  Future<AppVerConfig> getAppVerConfig() async {
    throw UnimplementedError();
  }

  @override
  Future<AppMaintConfig> getAppMaintConfig() {
    throw UnimplementedError();
  }
}
