// Project imports:
import '../../interfaces/analytics.dart';
import '../../../logic/types/analytics_event.dart';

/// devフレーバー用の Firebase Analytics
class DevAnalytics implements Analytics {
  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
