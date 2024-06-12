// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// Project imports:
import '../../state/di/external.dart';
import '../../state/providers/flavor.dart';
import 'go_router.dart';
import 'mobile_simulator.dart';
import '../theme/fonts.dart';

/// ルーターに従って画面を表示
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ログ用のコンソールオブジェクト
    // 初回のアクセスでグローバルにキャッシュされる。
    // 以降、ref.watch せずに 'logger' として呼び出せる
    final console = ref.watch(consoleProvider);
    final flavor = ref.watch(flavorProvider);
    final router = ref.watch(goRouterProvider);

    console.yellow('App is build with FLAVOR: ${flavor.name}');

    return MaterialApp.router(
      routerDelegate: router.routerDelegate, // GoRouter
      routeInformationParser: router.routeInformationParser, // GoRouter
      routeInformationProvider: router.routeInformationProvider, // GoRouter
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return MobileSimulatorView(
          child: child ?? const SizedBox.shrink(),
        );
      },
      localizationsDelegates:
          AppLocalizations.localizationsDelegates, // localizations
      supportedLocales: AppLocalizations.supportedLocales, // localizations
      locale: Locale(Intl.systemLocale),
      theme: ThemeData(
        fontFamily: BrandTextStyle.bodyS.fontFamily,
      ),
    );
  }
}
