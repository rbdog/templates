import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/validators/app_version.dart';
import 'package:my_app/logic/types/app_update_urgency.dart';
import 'package:my_app/state/providers/api.dart';

/// アプリアップデート対応
class AppUpdateUrgencyNotifier extends AsyncNotifier<AppUpdateUrgency> {
  @override
  Future<AppUpdateUrgency> build() async {
    return _getUrgency();
  }

  /// 最新バージョン情報を取得
  Future<AppUpdateUrgency> _getUrgency() async {
    /// 利用可能なアプリバージョンを取得
    final remoteConfig = ref.read(remoteConfigProvider);
    final available = await remoteConfig.getAvailableAppVersion();

    /// このアプリのバージョンを取得
    final appInfo = ref.read(appInfoProvider);
    final appVersion = await appInfo.getAppVersion();

    /// 2つの情報を比較
    const validator = AppVersionValidator();
    final urgency = validator.validateAppVersion(
      available,
      appVersion,
    );
    return urgency;
  }

  /// 最新バージョン情報を取得して 反映
  Future<void> fetchUrgency() async {
    final urgency = await _getUrgency();
    state = AsyncData(urgency);
  }
}
