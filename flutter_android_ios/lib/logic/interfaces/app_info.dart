/// アプリ情報
abstract interface class AppInfo {
  /// このアプリのバージョンを取得
  Future<String> getAppVersion();
}
