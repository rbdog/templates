import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/auth/index.dart';
import '../../di.dart';

class SignInCredentialNotifier extends StreamNotifier<SignInCredential?> {
  @override
  Stream<SignInCredential?> build() {
    final auth = ref.read(firebaseAuthProvider);
    return auth.watchCredential();
  }
}
