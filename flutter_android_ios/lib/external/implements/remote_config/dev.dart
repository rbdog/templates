import 'package:my_app/external/logger.dart';
import 'package:my_app/logic/types/semantic_version.dart';
import 'package:my_app/external/interfaces/remote_config.dart';
import 'package:my_app/logic/types/app_version_config.dart';

/// devフレーバー用の Firebase Remote Config
class DevRemoteConfig implements RemoteConfig {
  @override
  Future<AppVersionConfig> getAppVersionConfig() async {
    externalLogger.info('最新のアプリバージョンを取得開始します');
    await Future.delayed(const Duration(seconds: 1));
    externalLogger.info('最新のアプリバージョンを取得完了しました');
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
