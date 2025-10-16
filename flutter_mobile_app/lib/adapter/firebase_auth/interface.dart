import '../../logic/auth/index.dart';

/// Firebase Auth
abstract interface class FirebaseAuth {
  /// 認証の変化を監視
  Stream<SignInCredential?> watchCredential();

  /// サインインしているかどうか
  Future<bool> isSignedIn();

  /// サインインを実行
  Future<void> signIn(AuthProvider signInWith);

  /// サインアウトを実行
  Future<void> signOut();
}
