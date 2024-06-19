// Project imports:

import '../../logic/types/user.dart';

/// User API
abstract interface class UserApi {
  /// ユーザーを取得
  Future<User?> getUser({
    required String id,
  });
}
