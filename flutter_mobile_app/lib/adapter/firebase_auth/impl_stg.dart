import '../../logic/auth/index.dart';
import 'interface.dart';

/// stgフレーバー用の Firebase Auth
class ImplStg implements FirebaseAuth {
  @override
  Stream<SignInCredential?> watchCredential() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() {
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(AuthProvider signInWith) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
