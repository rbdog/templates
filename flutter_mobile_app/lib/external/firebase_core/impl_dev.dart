// Project imports:
import '../logger.dart';
import 'interface.dart';

/// devフレーバー用の Firebase Core
class ImplDev implements FirebaseCore {
  @override
  Future<void> init() async {
    externalLogger.info('firebase core の初期化を開始します');
    await Future.delayed(const Duration(seconds: 1));
    externalLogger.info('firebase core の初期化が完了しました');
  }
}
