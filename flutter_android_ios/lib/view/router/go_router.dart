// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import '../pages/edit.dart';
import '../pages/home.dart';
import '../pages/sign_in.dart';
import '../pages/splash.dart';
import 'page_path.dart';
import 'signed_in_shell.dart';
import 'version_updater_shell.dart';

/// Provide GoRouter
final goRouterProvider = Provider(
  (ref) {
    /// スプラッシュ画面
    final splash = GoRoute(
      path: PageId.splash.path,
      name: PageId.splash.name,
      builder: (_, __) => const SplashPage(),
    );

    /// サインイン画面
    final signIn = GoRoute(
      path: PageId.signIn.path,
      name: PageId.signIn.name,
      builder: (_, __) => const SignInPage(),
    );

    /// 一般画面たち
    final signedInPages = [
      GoRoute(
        path: PageId.home.path,
        name: PageId.home.name,
        builder: (_, __) => const HomePage(),
      ),
      GoRoute(
        path: PageId.edit.path,
        name: PageId.edit.name,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return EditPage(todoId: id);
        },
      ),
    ];

    /// サインイン限定の画面範囲
    final signedInRoute = ShellRoute(
      routes: signedInPages,
      builder: (_, __, child) {
        return SignedInShell(child: child);
      },
    );

    /// アプリ アップデート に反応する画面範囲
    final updaterRoute = ShellRoute(
      routes: [
        // サインイン画面
        signIn,
        // サインイン限定の画面範囲
        signedInRoute,
      ],
      builder: (_, __, child) {
        return VersionUpdaterShell(child: child);
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
