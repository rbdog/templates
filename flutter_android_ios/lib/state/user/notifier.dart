// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/user_api/provider.dart';
import '../../logic/user/types/user.dart';
import '../auth_cert/provider.dart';

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
