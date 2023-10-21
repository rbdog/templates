/// アプリのアップデート対応
enum AppUpdateAction {
  /// 特に対応不要
  none,

  /// 強制アップデート画面を見せる
  showImmidiateUpdate,

  /// 任意アップデートダイアログを見せる
  showFrexibleUpdate,
}
