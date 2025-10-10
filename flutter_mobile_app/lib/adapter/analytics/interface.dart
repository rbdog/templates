// Project imports:
import '../../logic/analytics/types/analytics_event.dart';

/// Firebase Analytics
abstract interface class Analytics {
  /// イベントを送信
  Future<void> sendEvent(AnalyticsEvent event);
}
