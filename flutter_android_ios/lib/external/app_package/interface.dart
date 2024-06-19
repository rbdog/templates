// Project imports:
import '../../logic/semver/types/semver.dart';

/// アプリ情報
abstract interface class AppPackage {
  /// このアプリのバージョンを取得
  Future<Semver> getAppVersion();
}
