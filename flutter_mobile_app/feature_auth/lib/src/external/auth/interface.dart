// Project imports:

import '../../logic/types/auth_cert.dart';
import '../../logic/types/sign_in_with.dart';

/// Firebase Auth
abstract interface class Auth {
  /// 認証の変化を監視
  Stream<AuthCert?> watchCert();

  /// サインインしているかどうか
  Future<bool> isSignedIn();

  /// サインインを実行
  Future<void> signIn(SignInWith signInWith);

  /// サインアウトを実行
  Future<void> signOut();
}
