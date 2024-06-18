// Project imports:
import 'semver.dart';

/// アプリバージョン設定値
class AppverConfig {
  const AppverConfig({
    required this.latest,
    required this.minRecommended,
    required this.minSupported,
  });

  /// 最新
  final Semver latest;

  /// 推奨される最低バージョン
  final Semver minRecommended;

  /// サポートされる最低バージョン
  final Semver minSupported;
}
