// Project imports:

// Project imports:
import '../../logic/credential/types/credential.dart';
import '../../logic/credential/types/sign_in_with.dart';
import 'interface.dart';

/// stgフレーバー用の Firebase Auth
class ImplStg implements Auth {
  @override
  Stream<Credential?> watchCredential() {
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
