// Project imports:
import 'interface.dart';
import '../../logic/types/appver_config.dart';
import '../../logic/types/semver.dart';

/// devフレーバー用の Firebase Remote Config
class DevRemoteConfig implements RemoteConfig {
  @override
  Future<AppverConfig> getAppVersionConfig() async {
    await Future.delayed(const Duration(seconds: 1));
    return const AppverConfig(
      latest: Semver(
        major: 0,
        minor: 0,
        patch: 0,
      ),
      minRecommended: Semver(
        major: 0,
        minor: 0,
        patch: 0,
      ),
      minSupported: Semver(
        major: 0,
        minor: 0,
        patch: 0,
      ),
    );
  }
}
