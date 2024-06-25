// Project imports:
import '../../semver/types/semver.dart';

/// アプリバージョン設定値
class AppVerConfig {
  const AppVerConfig({
    required this.latest,
    required this.yellowLine,
    required this.redLine,
  });

  /// 最新
  final Semver latest;

  /// 推奨される最低バージョン
  final Semver yellowLine;

  /// サポートされる最低バージョン
  final Semver redLine;
}
