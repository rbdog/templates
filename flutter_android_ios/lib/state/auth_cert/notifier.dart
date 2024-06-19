// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/auth/provider.dart';
import '../../logic/auth_cert/types/auth_cert.dart';

class AuthCertNotifier extends StreamNotifier<AuthCert?> {
  @override
  Stream<AuthCert?> build() {
    final auth = ref.read(authProvider);
    return auth.watchCert();
  }
}
