import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/auth/index.dart';
import 'sign_in_credential.dart';

final signInCredentialProvider =
    StreamNotifierProvider.autoDispose<
      SignInCredentialNotifier,
      SignInCredential?
    >(() {
      return SignInCredentialNotifier();
    });
