import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di.dart';
import '../../domain/auth/index.dart';
import '../../ports/firebase_auth.dart';

/// サインインを実行する
class SignIn {
  const SignIn({required this.auth});

  final FirebaseAuth auth;

  Future<void> call(AuthProvider signInWith) => auth.signIn(signInWith);
}

final signInProvider = Provider<SignIn>((ref) {
  return SignIn(auth: ref.read(firebaseAuthProvider));
});
