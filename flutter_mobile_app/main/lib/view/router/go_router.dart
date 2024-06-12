// Package imports:
import 'package:feature_app_update/feature_app_update.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_router/feature_router.dart';
import 'package:feature_todo/feature_todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../pages/splash.dart';

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
        return SignedInShell(
          builder: (user) => const SignInPage(),
        );
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
