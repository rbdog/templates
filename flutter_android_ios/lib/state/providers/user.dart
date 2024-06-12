// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/user.dart';
import '../notifiers/user.dart';

typedef _Notifier = UserNotifier;
typedef _State = User?;

/// User
final userProvider = StreamNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
