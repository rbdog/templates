import '../../logic/debug/index.dart';
import '../../logic/marketing/index.dart';
import 'interface.dart';

/// devフレーバー用の Firebase Analytics
class ImplDev implements FirebaseAnalytics {
  const ImplDev({required this.logger});
  final Logger logger;

  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    logger.info('アナリティクスにイベントを送信します');
    await Future.delayed(const Duration(seconds: 1));
    logger.info('アナリティクスにイベントを送信しました');
  }
}
