import '../../logic/debug/index.dart';

/// アプリ情報
abstract interface class AppInfo {
  /// このアプリのバージョンを取得
  Future<Semver> getVer();
}
