import 'package:my_app/core/features/logger.dart';
import 'package:my_app/core/interfaces/firebase_core.dart';

/// devフレーバー用の Firebase Core
class DevFirebaseCore implements FirebaseCore {
  @override
  Future<void> init() async {
    logger.info('firebase core の初期化を開始します');
    await Future.delayed(const Duration(seconds: 1));
    logger.info('firebase core の初期化が完了しました');
  }
}
