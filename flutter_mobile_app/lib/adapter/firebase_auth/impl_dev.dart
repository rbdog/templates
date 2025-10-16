// Dart imports:
import 'dart:async';

import '../../logic/auth/index.dart';
import 'interface.dart';

/// devフレーバー用の Firebase Auth
class ImplDev implements FirebaseAuth {
  final streamController = StreamController<SignInCredential?>();

  @override
  Stream<SignInCredential?> watchCredential() {
    // 1秒後にサインインを伝える
    Future.delayed(const Duration(seconds: 1)).then((_) {
      streamController.sink.add(
        const SignInCredential(
          accessToken: 'テストトークン',
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
  Future<void> signIn(AuthProvider signInWith) async {
    switch (signInWith) {
      case AuthProvider.google:
        streamController.sink.add(
          const SignInCredential(
            accessToken: 'テストトークン',
            refreshToken: 'テストリフレッシュトークン',
            userId: 'TEST_GOOGLE_USER_ID',
          ),
        );
        break;
      case AuthProvider.apple:
        streamController.sink.add(
          const SignInCredential(
            accessToken: 'テストトークン',
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
