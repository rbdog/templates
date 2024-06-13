// Project imports:
import '../../interfaces/firebase_core.dart';

/// devフレーバー用の Firebase Core
class DevFirebaseCore implements FirebaseCore {
  @override
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
