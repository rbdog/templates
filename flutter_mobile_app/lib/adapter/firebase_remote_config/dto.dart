// ignore_for_file: non_constant_identifier_names

// JSON に合わせた型

/// アプリバージョン設定値
class DtoAppVerConfig {
  const DtoAppVerConfig({
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
class DtoAppMaintConfig {
  const DtoAppMaintConfig({required this.plan});

  /// 予定
  final DtoAppMaintPlan? plan;
}

/// アプリメンテナンス予定
class DtoAppMaintPlan {
  const DtoAppMaintPlan({required this.start_at, required this.end_at});
  final String start_at;
  final String end_at;
}
