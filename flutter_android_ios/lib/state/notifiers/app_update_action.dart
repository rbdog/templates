import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/features/app_updater.dart';
import 'package:my_app/logic/types/app_update_action.dart';
import 'package:my_app/state/providers/api.dart';

/// アプリアップデート対応
class AppUpdateActionNotifier extends AsyncNotifier<AppUpdateAction> {
  @override
  Future<AppUpdateAction> build() async {
    return _getLatestAction();
  }

  /// 最新バージョン情報を取得
  Future<AppUpdateAction> _getLatestAction() async {
    /// 利用可能なアプリバージョンを取得
    final remoteConfig = ref.read(remoteConfigProvider);
    final available = await remoteConfig.getAvailableAppVersion();

    /// このアプリのバージョンを取得
    final appInfo = ref.read(appInfoProvider);
    final appVersion = await appInfo.getAppVersion();

    /// 2つの情報を比較
    const updater = AppUpdater();
    final action = updater.makeAction(available, appVersion);
    return action;
  }

  /// 最新バージョン情報を取得して 反映
  Future<void> fetchLatestAction() async {
    final latestAction = await _getLatestAction();
    state = AsyncData(latestAction);
  }
}
