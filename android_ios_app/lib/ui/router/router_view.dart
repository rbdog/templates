import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/ui/widgets/browser_adapter.dart';
import 'package:my_app/ui/theme/fonts.dart';
import 'package:my_app/ui/router/go_router.dart';

/// ルーターに従って画面を表示
class RouterView extends ConsumerWidget {
  const RouterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerDelegate: router.routerDelegate, // GoRouter
      routeInformationParser: router.routeInformationParser, // GoRouter
      routeInformationProvider: router.routeInformationProvider, // GoRouter
      debugShowCheckedModeBanner: false,
      builder: (_, child) {
        return BrowserAdapter(child: child);
      },
      theme: ThemeData(
        fontFamily: BrandText.bodyS.fontFamily,
      ),
    );
  }
}
