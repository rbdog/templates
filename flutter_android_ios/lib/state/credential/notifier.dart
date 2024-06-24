// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/auth/provider.dart';
import '../../logic/credential/types/credential.dart';

class CredentialNotifier extends StreamNotifier<Credential?> {
  @override
  Stream<Credential?> build() {
    final auth = ref.read(authProvider);
    return auth.watchCredential();
  }
}
