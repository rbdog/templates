// ignore_for_file: non_constant_identifier_names

// JSON に合わせた型

/// アプリバージョン設定値
class AppVerConfig {
  const AppVerConfig({
    required this.latest,
    required this.yellow_line,
    required this.red_line,
  });

  /// 最新
  final String latest;

  /// 推奨される最低バージョン
  final String yellow_line;

  /// サポートされる最低バージョン
  final String red_line;
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
