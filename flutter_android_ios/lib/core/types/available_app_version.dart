/// 利用可能なアプリバージョン
class AvailableAppVersion {
  const AvailableAppVersion({
    required this.immediateUpdate,
    required this.flexibleUpdate,
  });

  /// 強制アップデートするバージョン
  final String immediateUpdate;

  /// 任意アップデートするバージョン
  final String flexibleUpdate;
}
