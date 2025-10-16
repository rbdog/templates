import '../../logic/debug/index.dart';
import 'interface.dart';

/// devフレーバー用の Firebase Core
class ImplDev implements FirebaseCore {
  const ImplDev({required this.logger});
  final Logger logger;

  @override
  Future<void> init() async {
    logger.info('firebase core の初期化を開始します');
    await Future.delayed(const Duration(seconds: 1));
    logger.info('firebase core の初期化が完了しました');
  }
}
