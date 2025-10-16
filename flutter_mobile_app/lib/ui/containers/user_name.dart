import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/user/index.dart';
import '../pages/error_unknown.dart';

class UserNameContainer extends ConsumerWidget {
  const UserNameContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(userProvider);

    return switch (asyncUser) {
      AsyncData(value: final user) => switch (user == null) {
        true => Text('(未ログイン)'),
        false => Text(user!.nickname),
      },
      AsyncError(:final error, :final stackTrace) => ErrorUnknownPage(
        error: error,
        stackTrace: stackTrace,
      ),
      _ => Text('...'),
    };
  }
}
