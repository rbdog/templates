import '../../domain/support/index.dart';
import '../../ports/firebase_remote_config.dart';

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
