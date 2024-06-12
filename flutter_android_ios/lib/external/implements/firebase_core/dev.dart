import 'package:my_app/external/interfaces/firebase_core.dart';
import 'package:my_app/external/logger.dart';

/// devフレーバー用の Firebase Core
class DevFirebaseCore implements FirebaseCore {
  @override
  Future<void> init() async {
    externalLogger.info('firebase core の初期化を開始します');
    await Future.delayed(const Duration(seconds: 1));
    externalLogger.info('firebase core の初期化が完了しました');
  }
}
