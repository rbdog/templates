// Dart imports:
import 'dart:async';

// Project imports:
import '../../logic/user/types/user.dart';
import 'interface.dart';

// Project imports:

/// dev
class ImplDev implements UserApi {
  @override
  Future<User?> getUser({required String id}) async {
    return const User(
      id: 'TEST_USER_ID',
      nickname: 'テストユーザー',
    );
  }
}
