/// アプリのアップデート設定
enum AppUpdateRule {
  /// 対応不要
  none,

  /// アップデートをおすすめする
  recommend,

  /// アップデートを強制する
  force,
}

// --- latest ---

// ここにいるユーザー | 対応不要 none

// --- yellow line ---

// ここにいるユーザー | アップデートをおすすめする recommend

// --- red line ---

// ここにいるユーザー | アップデートを強制する force
