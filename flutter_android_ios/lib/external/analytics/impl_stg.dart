// Project imports:
import '../../logic/analytics_event/types/analytics_event.dart';
import 'interface.dart';

/// stgフレーバー用の Firebase Analytics
class ImplStg implements Analytics {
  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    // DO NOTHING
  }
}
