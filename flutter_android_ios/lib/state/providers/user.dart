import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/user.dart';
import 'package:my_app/state/notifiers/user.dart';

typedef _Notifier = UserNotifier;
typedef _State = User?;

/// User
final userProvider = StreamNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
