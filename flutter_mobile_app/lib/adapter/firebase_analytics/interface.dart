import '../../logic/marketing/index.dart';

/// Firebase Analytics
abstract interface class FirebaseAnalytics {
  /// イベントを送信
  Future<void> sendEvent(AnalyticsEvent event);
}
