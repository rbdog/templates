// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/auth_cert.dart';
import '../../external/auth/provider.dart';

/// AuthCert
class AuthCertNotifier extends StreamNotifier<AuthCert?> {
  @override
  Stream<AuthCert?> build() {
    final auth = ref.read(authProvider);
    return auth.watchCert();
  }
}
