import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../__gen__/l10n/l10n.dart';
import '../theme/fonts.dart';
import 'go_router.dart';
import 'mobile_simulator_view.dart';

/// ルーターに従って画面を表示
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerDelegate: router.routerDelegate, // GoRouter
      routeInformationParser: router.routeInformationParser, // GoRouter
      routeInformationProvider: router.routeInformationProvider, // GoRouter
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return MobileSimulatorView(child: child ?? const SizedBox.shrink());
      },
      localizationsDelegates:
          AppLocalizations.localizationsDelegates, // localizations
      supportedLocales: AppLocalizations.supportedLocales, // localizations
      locale: Locale(Intl.systemLocale),
      theme: ThemeData(fontFamily: BrandFont.general),
    );
  }
}
