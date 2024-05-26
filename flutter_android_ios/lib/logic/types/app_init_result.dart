/// アプリ初期化の結果
enum AppInitResult {
  /// 強制アップデートが見つかったため中断
  immidiateUpdate,

  /// ユーザーはサインアウト中
  signedOut,

  /// ユーザーはサインイン中
  signedIn,
}
