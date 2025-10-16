import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/auth/index.dart';
import '../di/adapters.dart';

class SignInCredentialNotifier
    extends AutoDisposeStreamNotifier<SignInCredential?> {
  @override
  Stream<SignInCredential?> build() {
    final auth = ref.read(firebaseAuthProvider);
    return auth.watchCredential();
  }
}
