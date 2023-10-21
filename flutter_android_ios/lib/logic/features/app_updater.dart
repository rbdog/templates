import 'package:my_app/logic/types/app_update_action.dart';
import 'package:my_app/logic/types/available_app_version.dart';

/// アプリのアップデートを担当するクラス
class AppUpdater {
  const AppUpdater();

  /// 情報からアップデートのアクションを決定する
  ///   - available: 最新の利用可能なアプリバージョン
  ///   - appVersion: このアプリのバージョン
  AppUpdateAction makeAction(
    AvailableAppVersion available,
    String appVersion,
  ) {
    /// 強制アップデートするべきバージョン
    final immidiate = available.immediateUpdate;
    final shouldImmidiatly = _compareVersions(appVersion, immidiate);
    if (shouldImmidiatly > 0) {
      // 強制アップデートが必要
      return AppUpdateAction.showImmidiateUpdate;
    }

    /// 任意アップデートするべきバージョン
    final frexible = available.flexibleUpdate;
    final shouldFrexibly = _compareVersions(appVersion, frexible);
    if (shouldFrexibly > 0) {
      // 任意アップデートが必要
      return AppUpdateAction.showFrexibleUpdate;
    }

    /// アクション不要
    return AppUpdateAction.none;
  }

  /// X.Y.Z 形式のバージョンを比較する
  /// _compareVersions(A, B)
  /// <return>
  ///   -1: Aの方が大きい
  ///    0: 等しい
  ///   +1: Bの方が大きい
  int _compareVersions(String verA, String verB) {
    final partsA = verA.split('.').map(int.parse).toList();
    final partsB = verB.split('.').map(int.parse).toList();

    // Compare each part of the version
    for (int i = 0; i < partsA.length; i++) {
      final a = partsA[i];
      final b = partsB[i];
      if (a < b) {
        return 1;
      } else if (a > b) {
        return -1;
      }
    }

    return 0;
  }
}
