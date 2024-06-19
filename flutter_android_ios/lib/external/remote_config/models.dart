/// アプリバージョン設定値
class AppVersionConfig {
  const AppVersionConfig({
    required this.latest,
    required this.minRecommended,
    required this.minSupported,
  });

  /// 最新
  final String latest;

  /// 推奨される最低バージョン
  final String minRecommended;

  /// サポートされる最低バージョン
  final String minSupported;
}
