import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../logic/support/index.dart';
import '../../state/support/provider.dart';
import '../pages/error_unknown.dart';
import '../pages/maint.dart';
import '../stateless_components/maint_soon_banner.dart';
import '../stateless_components/splash_view.dart';

/// メンテナンス状態を管理しているシェル
class AppMaintShell extends ConsumerWidget {
  const AppMaintShell({super.key, required this.builder});

  final Widget Function() builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAnnounce = ref.watch(appMaintAnnounceProvider);

    switch (asyncAnnounce) {
      case AsyncData(:final value):
        switch (value) {
          case AppMaintAnnounceNone():
            return builder();
          case AppMaintAnnounceSoon(:final startAt, :final endAt):
            return Scaffold(
              body: Column(
                children: [
                  MaintSoonBanner(startAt: startAt, endAt: endAt),
                  Expanded(child: builder()),
                ],
              ),
            );
          case AppMaintAnnounceInProgress(:final endAt):
            return MaintPage(endAt: endAt);
        }
      case AsyncError(:final error, :final stackTrace):
        return ErrorUnknownPage(error: error, stackTrace: stackTrace);
      default:
        return const SplashView(isLoading: true);
    }
  }
}
