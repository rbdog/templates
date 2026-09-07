import '../../domain/marketing/index.dart';
import '../../ports/firebase_analytics.dart';

/// prdフレーバー用の Firebase Analytics
class ImplPrd implements FirebaseAnalytics {
  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    // DO NOTHING
  }
}
