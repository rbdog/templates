import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/validators/app_version.dart';
import 'package:my_app/state/notifiers/logger.dart';
import 'package:my_app/logic/types/app_init_result.dart';
import 'package:my_app/logic/types/app_update_policy.dart';
import 'package:my_app/state/providers/api.dart';

/// アプリ初期化の結果
class AppInitResultNotifier extends AsyncNotifier<AppInitResult> {
  @override
  Future<AppInitResult> build() async {
    // ログ
    logger.info('アプリの初期化を開始します');

    // これはデモなので適当に3秒まって待機画面を見せる
    // この行を消しても問題ない
    await Future.delayed(const Duration(seconds: 3));

    // Firebaseを初期化
    final firebaseCore = ref.read(firebaseCoreProvider);
    await firebaseCore.init();

    // システムロケールを初期化
    final systemLocale = ref.read(systemLocaleProvider);
    await systemLocale.init();

    // アップデートを確認
    /// 利用可能なアプリバージョンを取得
    final remoteConfig = ref.read(remoteConfigProvider);
    final appVersionConfig = await remoteConfig.getAppVersionConfig();

    /// このアプリのバージョンを取得
    final appInfo = ref.read(appInfoProvider);
    final appVersion = await appInfo.getAppVersion();

    /// 2つのバージョンを比較
    const validator = AppVersionValidator();
    final urgency = validator.validate(
      config: appVersionConfig,
      appVersion: appVersion,
    );
    if (urgency == AppUpdatePolicy.force) {
      logger.info('アップデートを強制されたため 初期化を中断します');
      return AppInitResult.forceUpdate;
    }

    // サインインしているかどうか
    final auth = ref.read(authProvider);
    final isSignedIn = await auth.isSignedIn();

    logger.info('アプリの初期化が完了しました');

    if (isSignedIn) {
      return AppInitResult.signedIn;
    } else {
      return AppInitResult.signedOut;
    }
  }
}
