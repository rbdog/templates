import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/types/user.dart';
import 'package:my_app/runner/providers/api.dart';

/// User
class UserNotifier extends StreamNotifier<User?> {
  @override
  Stream<User?> build() {
    final auth = ref.read(authProvider);
    return auth.watchUser();
  }
}
