// Project imports:

// Project imports:
import '../../logic/credential/types/credential.dart';
import '../../logic/credential/types/sign_in_with.dart';

/// Firebase Auth
abstract interface class Auth {
  /// 認証の変化を監視
  Stream<Credential?> watchCredential();

  /// サインインしているかどうか
  Future<bool> isSignedIn();

  /// サインインを実行
  Future<void> signIn(SignInWith signInWith);

  /// サインアウトを実行
  Future<void> signOut();
}
