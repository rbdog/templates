// Flutter imports:
import 'package:feature_theme/feature_theme.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'mobile_simulator.dart';
import 'router.dart';

/// ルーターに従って画面を表示
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
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
