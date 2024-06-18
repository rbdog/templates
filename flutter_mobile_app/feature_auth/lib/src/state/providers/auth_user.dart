// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/auth_user.dart';
import '../notifiers/auth_user.dart';

typedef _Notifier = AuthUserNotifier;
typedef _State = AuthUser?;

/// User
final authUserProvider = StreamNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
