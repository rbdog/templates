// ignore_for_file: non_constant_identifier_names

// JSON に合わせた型

/// アプリバージョン設定値
class AppVerConfig {
  const AppVerConfig({
    required this.latest,
    required this.min_recommended,
    required this.min_supported,
  });

  /// 最新
  final String latest;

  /// 推奨される最低バージョン
  final String min_recommended;

  /// サポートされる最低バージョン
  final String min_supported;
}

/// アプリメンテナンス設定値
class AppMaintConfig {
  const AppMaintConfig({
    required this.plan,
  });

  /// 予定
  final AppMaintPlan? plan;
}

/// アプリメンテナンス予定
class AppMaintPlan {
  const AppMaintPlan({
    required this.start_at,
    required this.end_at,
  });
  final String start_at;
  final String end_at;
}
