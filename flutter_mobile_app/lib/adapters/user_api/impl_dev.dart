// Dart imports:
import 'dart:async';

import '../../domain/user/index.dart';
import '../../ports/user_api.dart';

/// dev
class ImplDev implements UserApi {
  @override
  Future<User?> getUser({required String id}) async {
    return const User(id: 'TEST_USER_ID', nickname: 'テストユーザー');
  }
}
