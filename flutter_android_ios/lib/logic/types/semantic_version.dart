/// セマンティックバージョン
class SemanticVersion {
  const SemanticVersion({
    required this.major,
    required this.minor,
    required this.patch,
  });

  /// メジャー
  final int major;

  /// マイナー
  final int minor;

  /// パッチ
  final int patch;
}
