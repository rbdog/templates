// Project imports:
import '../../interfaces/analytics.dart';
import '../../logger.dart';
import '../../../logic/types/analytics_event.dart';

/// devフレーバー用の Firebase Analytics
class DevAnalytics implements Analytics {
  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    externalLogger.info('アナリティクスにイベントを送信します');
    await Future.delayed(const Duration(seconds: 1));
    externalLogger.info('アナリティクスにイベントを送信しました');
  }
}
