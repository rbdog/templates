import 'package:my_app/logic/types/semantic_version.dart';

/// アプリバージョン設定値
class AppVersionConfig {
  const AppVersionConfig({
    required this.latest,
    required this.minRecommended,
    required this.minSupported,
  });

  /// 最新
  final SemanticVersion latest;

  /// 推奨される最低バージョン
  final SemanticVersion minRecommended;

  /// サポートされる最低バージョン
  final SemanticVersion minSupported;
}
