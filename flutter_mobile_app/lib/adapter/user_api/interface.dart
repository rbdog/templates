// Project imports:

// Project imports:
import '../../logic/user/types/user.dart';

/// User API
abstract interface class UserApi {
  /// ユーザーを取得
  Future<User?> getUser({
    required String id,
  });
}
