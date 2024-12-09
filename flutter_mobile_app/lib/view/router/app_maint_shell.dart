// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/app_maint_announce/types/app_maint_announce.dart';
import '../../state/app_maint_announce/provider.dart';
import '../widgets/error_unknown.dart';
import '../widgets/maint.dart';
import '../widgets/maint_banner.dart';
import '../widgets/splash.dart';

/// メンテナンス状態を管理しているシェル
class AppMaintShell extends ConsumerWidget {
  const AppMaintShell({
    super.key,
    required this.builder,
  });

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
              appBar: AppBar(
                title: MaintSoonBanner(startAt: startAt, endAt: endAt),
              ),
              body: builder(),
            );
          case AppMaintAnnounceInProgress(:final endAt):
            return MaintPage(endAt: endAt);
        }
      case AsyncError(:final error, :final stackTrace):
        return ErrorUnknownPage(error: error, stackTrace: stackTrace);
      default:
        return const Splash(isLoading: true);
    }
  }
}
