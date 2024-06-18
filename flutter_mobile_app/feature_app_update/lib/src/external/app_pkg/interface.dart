// Project imports:
import '../../logic/types/semver.dart';

/// アプリ情報
abstract interface class AppPkg {
  /// このアプリのバージョンを取得
  Future<Semver> getVersion();
}
