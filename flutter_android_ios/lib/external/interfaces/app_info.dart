import 'package:my_app/logic/types/semantic_version.dart';

/// アプリ情報
abstract interface class AppInfo {
  /// このアプリのバージョンを取得
  Future<SemanticVersion> getAppVersion();
}
