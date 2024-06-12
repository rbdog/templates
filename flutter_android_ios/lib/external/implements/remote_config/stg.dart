// Project imports:
import '../../interfaces/remote_config.dart';
import '../../../logic/types/app_version_config.dart';
import '../../../logic/types/semantic_version.dart';

/// stgフレーバー用の Firebase Remote Config
class StgRemoteConfig implements RemoteConfig {
  @override
  Future<AppVersionConfig> getAppVersionConfig() async {
    return const AppVersionConfig(
      latest: SemanticVersion(
        major: 0,
        minor: 0,
        patch: 0,
      ),
      minRecommended: SemanticVersion(
        major: 0,
        minor: 0,
        patch: 0,
      ),
      minSupported: SemanticVersion(
        major: 0,
        minor: 0,
        patch: 0,
      ),
    );
  }
}
