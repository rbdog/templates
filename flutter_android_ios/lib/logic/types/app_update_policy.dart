/// アプリのアップデート緊急度
enum AppUpdatePolicy {
  /// 対応不要
  none,

  /// アップデートをおすすめする
  recommend,

  /// アップデートを強制する
  force,
}



// --- latest ---

// ここにいるユーザー | 対応不要 none

// --- min_recommended ---

// ここにいるユーザー | アップデートをおすすめする recommend

// --- min_supported ---

// ここにいるユーザー | アップデートを強制する force
