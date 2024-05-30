import 'package:my_app/external/interfaces/auth.dart';
import 'package:my_app/logic/types/sign_in_with.dart';
import 'package:my_app/logic/types/user.dart';

/// stgフレーバー用の Firebase Auth
class StgAuth implements Auth {
  @override
  Stream<User?> watchUser() {
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
