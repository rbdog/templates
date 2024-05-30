/// 利用可能なアプリバージョン
class AvailableAppVersion {
  const AvailableAppVersion({
    required this.latest,
    required this.old,
    required this.tooOld,
  });

  /// 最新
  final String latest;

  /// 古い
  final String old;

  /// 古すぎる
  final String tooOld;
}
