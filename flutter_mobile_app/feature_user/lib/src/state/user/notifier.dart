// Package imports:
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/user_api/provider.dart';
import '../../logic/types/user.dart';

class UserNotifier extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final cert = await ref.read(authCertProvider.future);
    if (cert == null) return null;
    final api = ref.read(userApiProvider);
    final user = api.getUser(id: cert.userId);
    return user;
  }
}
