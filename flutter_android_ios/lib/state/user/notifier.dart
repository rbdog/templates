// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/user_api/provider.dart';
import '../../logic/user/types/user.dart';
import '../credential/provider.dart';

class UserNotifier extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final credential = await ref.read(credentialProvider.future);
    if (credential == null) return null;
    final api = ref.read(userApiProvider);
    final user = api.getUser(id: credential.userId);
    return user;
  }
}
