// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/auth_cert.dart';
import 'notifier.dart';

typedef _Notifier = AuthCertNotifier;
typedef _State = AuthCert?;

final authCertProvider = StreamNotifierProvider<_Notifier, _State>(
  () {
    return _Notifier();
  },
);
