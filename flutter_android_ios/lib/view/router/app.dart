import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_app/state/providers/api.dart';
import 'package:my_app/state/providers/flavor.dart';
import 'package:my_app/view/router/browser_adapter.dart';
import 'package:my_app/view/theme/fonts.dart';
import 'package:my_app/view/router/go_router.dart';

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

    console.info('App is build with FLAVOR: ${flavor.name}');

    return MaterialApp.router(
      routerDelegate: router.routerDelegate, // GoRouter
      routeInformationParser: router.routeInformationParser, // GoRouter
      routeInformationProvider: router.routeInformationProvider, // GoRouter
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return BrowserDebugView(child: child);
      },
      localizationsDelegates:
          AppLocalizations.localizationsDelegates, // localizations
      supportedLocales: AppLocalizations.supportedLocales, // localizations
      locale: Locale(Intl.systemLocale),
      theme: ThemeData(
        fontFamily: BrandText.bodyS.fontFamily,
      ),
    );
  }
}
