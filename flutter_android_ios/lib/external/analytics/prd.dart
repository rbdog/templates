import 'package:my_app/logic/interfaces/analytics.dart';
import 'package:my_app/logic/types/analytics_event.dart';

/// prdフレーバー用の Firebase Analytics
class PrdAnalytics implements Analytics {
  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    // DO NOTHING
  }
}
