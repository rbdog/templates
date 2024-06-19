// Project imports:

// Project imports:
import '../../logic/auth_cert/types/auth_cert.dart';
import '../../logic/auth_cert/types/sign_in_with.dart';
import 'interface.dart';

/// stgフレーバー用の Firebase Auth
class StgAuth implements Auth {
  @override
  Stream<AuthCert?> watchCert() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() {
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(SignInWith signInWith) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
