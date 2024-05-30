import 'package:my_app/logic/types/app_update_urgency.dart';
import 'package:my_app/logic/types/available_app_version.dart';

/// アプリのアップデートを担当するクラス
class AppVersionValidator {
  const AppVersionValidator();

  /// 情報からアップデートのアクションを決定する
  ///   - available: 現在利用可能なアプリバージョン
  ///   - appVersion: このアプリのバージョン
  AppUpdateUrgency validateAppVersion(
    AvailableAppVersion available,
    String appVersion,
  ) {
    /// 強制アップデートするべきか
    final shouldImmidiatly = _compareVersions(
      appVersion,
      available.tooOld,
    );
    if (shouldImmidiatly > 0) {
      // 強制アップデートが必要
      return AppUpdateUrgency.force;
    }

    /// アップデートをおすすめするべきか
    final shouldRecommend = _compareVersions(
      appVersion,
      available.old,
    );
    if (shouldRecommend > 0) {
      // アップデートをおすすめ
      return AppUpdateUrgency.recommend;
    }

    /// 対応不要
    return AppUpdateUrgency.none;
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
