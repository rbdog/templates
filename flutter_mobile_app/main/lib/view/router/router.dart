// Package imports:
import 'package:feature_app_update/feature_app_update.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_router/feature_router.dart';
import 'package:feature_todo/feature_todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'splash_shell.dart';

/// Provide GoRouter
final routerProvider = Provider(
  (ref) {
    /// サインイン画面
    final signIn = GoRoute(
      path: PageId.signIn.path,
      name: PageId.signIn.name,
      builder: (_, __) => const SignInPage(),
    );

    /// Todo 一覧画面
    final list = GoRoute(
      path: PageId.home.path,
      name: PageId.home.name,
      builder: (_, __) => const ListPage(),
    );

    /// Todo 編集画面
    final edit = GoRoute(
      path: PageId.edit.path,
      name: PageId.edit.name,
      builder: (_, state) {
        final id = state.pathParameters['id']!;
        return EditPage(todoId: id);
      },
    );

    /// サインインに守られたすべての画面
    final signedInShell = ShellRoute(
      routes: [
        list,
        edit,
      ],
      builder: (_, __, child) {
        return SignedInShell(
          builder: (_) => child,
        );
      },
    );

    /// アプリアップデートに守られたすべての画面
    final updaterShell = ShellRoute(
      routes: [
        signIn,
        signedInShell,
      ],
      builder: (_, __, child) {
        return VersionUpdaterShell(child: child);
      },
    );

    /// スプラッシュ画面に守られたすべての画面
    final splashShell = ShellRoute(
      routes: [
        updaterShell,
      ],
      builder: (_, __, child) {
        return SplashShell(
          builder: () => child,
        );
      },
    );

    return GoRouter(
      initialLocation: PageId.home.path,
      routes: [
        splashShell,
      ],
    );
  },
);
