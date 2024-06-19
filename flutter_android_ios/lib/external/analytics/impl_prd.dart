// Project imports:
import '../../logic/analytics_event/types/analytics_event.dart';
import 'interface.dart';

/// prdフレーバー用の Firebase Analytics
class PrdAnalytics implements Analytics {
  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    // DO NOTHING
  }
}
