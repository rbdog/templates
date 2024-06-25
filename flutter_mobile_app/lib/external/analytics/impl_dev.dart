// Project imports:
import '../../logic/analytics_event/types/analytics_event.dart';
import '../logger.dart';
import 'interface.dart';

/// devフレーバー用の Firebase Analytics
class ImplDev implements Analytics {
  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    externalLogger.info('アナリティクスにイベントを送信します');
    await Future.delayed(const Duration(seconds: 1));
    externalLogger.info('アナリティクスにイベントを送信しました');
  }
}
