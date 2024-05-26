import 'package:my_app/logic/features/logger.dart';
import 'package:my_app/logic/interfaces/remote_config.dart';
import 'package:my_app/logic/types/available_app_version.dart';

/// devフレーバー用の Firebase Remote Config
class DevRemoteConfig implements RemoteConfig {
  @override
  Future<AvailableAppVersion> getAvailableAppVersion() async {
    logger.info('最新のアプリバージョンを取得開始します');
    await Future.delayed(const Duration(seconds: 1));
    logger.info('最新のアプリバージョンを取得完了しました');
    return const AvailableAppVersion(
      immediateUpdate: '0.0.0',
      flexibleUpdate: '0.0.0',
    );
  }
}
