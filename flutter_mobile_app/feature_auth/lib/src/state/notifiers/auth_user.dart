// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/auth_user.dart';
import '../../external/auth/provider.dart';

/// Auth User
class AuthUserNotifier extends StreamNotifier<AuthUser?> {
  @override
  Stream<AuthUser?> build() {
    final auth = ref.read(authProvider);
    return auth.watchUser();
  }
}
