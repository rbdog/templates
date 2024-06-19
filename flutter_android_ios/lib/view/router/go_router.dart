// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import '../pages/edit.dart';
import '../pages/list.dart';
import '../pages/sign_in.dart';
import 'new_app_shell.dart';
import 'page_path.dart';
import 'signed_in_shell.dart';
import 'splash_completed_shell.dart';

/// Provide GoRouter
final goRouterProvider = Provider(
  (ref) {
    /// サインイン画面
    final signIn = GoRoute(
      path: PageId.signIn.path,
      name: PageId.signIn.name,
      builder: (_, __) => const SignInPage(),
    );

    /// ホーム画面
    final home = GoRoute(
      path: PageId.home.path,
      name: PageId.home.name,
      builder: (_, __) => const ListPage(),
    );

    /// 編集画面
    final edit = GoRoute(
      path: PageId.edit.path,
      name: PageId.edit.name,
      builder: (_, state) {
        final id = state.pathParameters['id']!;
        return EditPage(todoId: id);
      },
    );

    /// サインインしないと見れない画面範囲
    final signedInRoute = ShellRoute(
      routes: [
        home,
        edit,
      ],
      builder: (_, __, child) {
        return SignedInShell(
          builder: (_) => child,
        );
      },
    );

    /// 新しいアプリにバージョンアップしないと見れない画面範囲
    final newAppRoute = ShellRoute(
      routes: [
        signIn,
        signedInRoute,
      ],
      builder: (_, __, child) {
        return NewAppShell(child: child);
      },
    );

    /// スプラッシュ画面が終わらないと見れない画面範囲
    final splashCompletedShell = ShellRoute(
      routes: [
        newAppRoute,
      ],
      builder: (_, __, child) {
        return SplashCompletedShell(
          builder: () => child,
        );
      },
    );

    return GoRouter(
      initialLocation: PageId.home.path,
      debugLogDiagnostics: false,
      routes: [
        splashCompletedShell,
      ],
    );
  },
);
