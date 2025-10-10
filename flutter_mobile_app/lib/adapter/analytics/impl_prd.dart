// Project imports:
import '../../logic/analytics/types/analytics_event.dart';
import 'interface.dart';

/// prdフレーバー用の Firebase Analytics
class ImplPrd implements Analytics {
  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    // DO NOTHING
  }
}
