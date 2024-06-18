// Dart imports:
import 'dart:async';

// Project imports:

import '../../logic/types/auth_user.dart';
import 'interface.dart';
import '../../logic/types/sign_in_with.dart';

/// devフレーバー用の Firebase Auth
class DevAuth implements Auth {
  final streamController = StreamController<AuthUser?>();

  @override
  Stream<AuthUser?> watchUser() {
    // 1秒後にサインインを伝える
    Future.delayed(const Duration(seconds: 1)).then((_) {
      streamController.sink.add(
        const AuthUser(
          token: 'テストトークン',
          refreshToken: 'テストリフレッシュトークン',
          userId: 'TEST_USER_ID',
        ),
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
          const AuthUser(
            token: 'テストトークン',
            refreshToken: 'テストリフレッシュトークン',
            userId: 'TEST_GOOGLE_USER_ID',
          ),
        );
        break;
      case SignInWith.apple:
        streamController.sink.add(
          const AuthUser(
            token: 'テストトークン',
            refreshToken: 'テストリフレッシュトークン',
            userId: 'TEST_APPLE_USER_ID',
          ),
        );
        break;
    }
  }

  @override
  Future<void> signOut() async {
    streamController.sink.add(null);
  }
}
