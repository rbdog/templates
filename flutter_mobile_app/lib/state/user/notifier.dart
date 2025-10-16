import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/user/index.dart';
import '../auth/provider.dart';
import '../di/adapters.dart';

class UserNotifier extends AutoDisposeAsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final credential = await ref.read(signInCredentialProvider.future);
    if (credential == null) return null;
    final api = ref.read(userApiProvider);
    final user = api.getUser(id: credential.userId);
    return user;
  }
}
