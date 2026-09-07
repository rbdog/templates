import '../../domain/support/index.dart';
import '../../ports/firebase_remote_config.dart';

class ImplPrd implements FirebaseRemoteConfig {
  @override
  Future<AppVerConfig> getAppVerConfig() async {
    throw UnimplementedError();
  }

  @override
  Future<AppMaintConfig> getAppMaintConfig() {
    throw UnimplementedError();
  }
}
