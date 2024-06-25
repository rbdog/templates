/// セマンティックバージョン
class Semver {
  const Semver(
    this.major,
    this.minor,
    this.patch,
  );

  /// メジャー
  final int major;

  /// マイナー
  final int minor;

  /// パッチ
  final int patch;
}
