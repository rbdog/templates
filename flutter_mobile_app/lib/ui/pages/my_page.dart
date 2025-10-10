// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../state/user/provider.dart';
import '../widgets/error_bad_program.dart';
import '../widgets/error_unknown.dart';
import '../widgets/splash.dart';

class MyPagePage extends ConsumerWidget {
  const MyPagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(userProvider);

    switch (asyncUser) {
      case AsyncData(:final value):
        if (value == null) {
          return const ErrorBadProgramPage(
            message: 'サインインしていない状態でマイページを表示しました',
          );
        } else {
          return Scaffold(body: Center(child: Text(value.nickname)));
        }

      case AsyncError(:final error, :final stackTrace):
        return ErrorUnknownPage(error: error, stackTrace: stackTrace);

      default:
        return const Splash(isLoading: true);
    }
  }
}
