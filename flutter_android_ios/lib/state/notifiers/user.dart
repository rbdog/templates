// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/user.dart';
import '../di/external.dart';

/// User
class UserNotifier extends StreamNotifier<User?> {
  @override
  Stream<User?> build() {
    final auth = ref.read(authProvider);
    return auth.watchUser();
  }
}
