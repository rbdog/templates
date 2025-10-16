// Dart imports:
import 'dart:async';


import '../../logic/user/index.dart';
import 'interface.dart';



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
