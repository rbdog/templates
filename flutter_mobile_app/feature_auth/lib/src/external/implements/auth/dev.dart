// Dart imports:
import 'dart:async';

// Project imports:
import 'package:feature_user/feature_user.dart';

import '../../interfaces/auth.dart';
import '../../../logic/types/sign_in_with.dart';

/// devフレーバー用の Firebase Auth
class DevAuth implements Auth {
  final streamController = StreamController<User?>();

  @override
  Stream<User?> watchUser() {
    // 1秒後にサインインを伝える
    Future.delayed(const Duration(seconds: 1)).then((_) {
      streamController.sink.add(
        const User(id: 'TEST_USER_ID', nickname: 'テストユーザー'),
      );
    });
    return streamController.stream;
  }

  @override
  Future<bool> isSignedIn() async {
    Future.delayed(const Duration(seconds: 1));
    return true;
  }

  @override
  Future<void> signIn(SignInWith signInWith) async {
    switch (signInWith) {
      case SignInWith.google:
        streamController.sink.add(
          const User(id: 'TEST_USER_ID', nickname: 'テストGoogleユーザー'),
        );
        break;
      case SignInWith.apple:
        streamController.sink.add(
          const User(id: 'TEST_USER_ID', nickname: 'テストAppleユーザー'),
        );
        break;
    }
  }

  @override
  Future<void> signOut() async {
    streamController.sink.add(null);
  }
}
