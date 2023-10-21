import 'package:my_app/core/interfaces/analytics.dart';
import 'package:my_app/core/types/analytics_event.dart';

/// stgフレーバー用の Firebase Analytics
class StgAnalytics implements Analytics {
  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    // DO NOTHING
  }
}
