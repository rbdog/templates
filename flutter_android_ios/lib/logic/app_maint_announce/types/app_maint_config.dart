sealed class AppMaintConfig {}

class AppMaintConfigNoPlan extends AppMaintConfig {}

class AppMaintConfigWithPlan extends AppMaintConfig {
  AppMaintConfigWithPlan({
    required this.plan,
  });
  final AppMaintPlan plan;
}

class AppMaintPlan {
  AppMaintPlan({
    required this.startAt,
    required this.endAt,
  });
  final DateTime startAt;
  final DateTime endAt;
}
