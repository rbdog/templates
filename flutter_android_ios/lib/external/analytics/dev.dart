import 'package:my_app/logic/features/logger.dart';
import 'package:my_app/logic/interfaces/analytics.dart';
import 'package:my_app/logic/types/analytics_event.dart';

/// devフレーバー用の Firebase Analytics
class DevAnalytics implements Analytics {
  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    logger.info('アナリティクスにイベントを送信します');
    await Future.delayed(const Duration(seconds: 1));
    logger.info('アナリティクスにイベントを送信しました');
  }
}
