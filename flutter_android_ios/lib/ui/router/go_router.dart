import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/ui/pages/edit.dart';
import 'package:my_app/ui/pages/home.dart';
import 'package:my_app/ui/pages/sign_in.dart';
import 'package:my_app/ui/pages/splash.dart';
import 'package:my_app/ui/router/page_path.dart';
import 'package:my_app/ui/router/signed_in_scope.dart';
import 'package:my_app/ui/router/version_updater.dart';

/// Provide GoRouter
final goRouterProvider = Provider(
  (ref) {
    /// スプラッシュ画面
    final splash = GoRoute(
      path: PageId.splash.path,
      name: PageId.splash.routeName,
      builder: (_, __) => const SplashPage(),
    );

    /// サインイン画面
    final signIn = GoRoute(
      path: PageId.signIn.path,
      name: PageId.signIn.routeName,
      builder: (_, __) => const SignInPage(),
    );

    /// 一般画面たち
    final nomalPages = [
      GoRoute(
        path: PageId.home.path,
        name: PageId.home.routeName,
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        path: PageId.edit.path,
        name: PageId.edit.routeName,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return EditPage(memoId: id);
        },
      ),
    ];

    /// サインイン限定の画面範囲
    final signedinRoute = ShellRoute(
      // 一般画面たち全員
      routes: nomalPages,
      builder: (_, __, child) {
        return SignedInScope(child: child);
      },
    );

    /// アプリ アップデート に反応する画面範囲
    final updaterRoute = ShellRoute(
      routes: [
        // サインイン画面
        signIn,
        // サインイン限定の画面範囲
        signedinRoute,
      ],
      builder: (_, __, child) {
        return VersionUpdaterView(child: child);
      },
    );

    return GoRouter(
      initialLocation: PageId.splash.path,
      debugLogDiagnostics: false,
      routes: [
        splash,
        updaterRoute,
      ],
    );
  },
);
