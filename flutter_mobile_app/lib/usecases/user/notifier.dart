import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/user/index.dart';
import '../auth/provider.dart';
import '../../di.dart';

class UserNotifier extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final credential = await ref.read(signInCredentialProvider.future);
    if (credential == null) return null;
    final api = ref.read(userApiProvider);
    final user = api.getUser(id: credential.userId);
    return user;
  }
}
