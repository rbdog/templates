// Package imports:
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../external/providers.dart/user_api.dart';
import '../../logic/types/user.dart';

/// User
class UserNotifier extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final authUser = await ref.read(authUserProvider.future);
    if (authUser == null) return null;
    final api = ref.read(userApiProvider);
    final user = api.getUser(id: authUser.userId);
    return user;
  }
}
