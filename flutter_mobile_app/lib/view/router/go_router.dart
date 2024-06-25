// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import '../pages/home.dart';
import '../pages/todo_edit.dart';
import '../pages/todo_list.dart';
import '../pages/sign_in.dart';
import 'app_maint_shell.dart';
import 'app_updated_shell.dart';
import 'notified_shell.dart';
import 'page_path.dart';
import 'signed_in_shell.dart';
import 'splash_completed_shell.dart';

/// Provide GoRouter
final goRouterProvider = Provider(
  (ref) {
    /// サインイン画面
    final signIn = GoRoute(
      path: PagePath.signIn.path,
      name: PagePath.signIn.name,
      builder: (_, __) => const SignInPage(),
    );

    /// ホーム画面
    final home = GoRoute(
      path: PagePath.home.path,
      name: PagePath.home.name,
      builder: (_, __) => const HomePage(),
    );

    /// Todo編集画面
    final todoEdit = GoRoute(
      path: PagePath.todoEdit.path,
      name: PagePath.todoEdit.name,
      builder: (_, state) {
        final id = state.pathParameters['id']!;
        return TodoEditPage(id: id);
      },
    );

    /// Todoリスト画面
    final todoList = GoRoute(
      path: PagePath.todoList.path,
      name: PagePath.todoList.name,
      builder: (_, __) => const TodoListPage(),
    );

    /// サインインしないと見れない画面範囲
    final signedInShell = ShellRoute(
      routes: [
        home,
        todoList,
        todoEdit,
      ],
      builder: (_, __, child) {
        return SignedInShell(
          builder: (_) => child,
        );
      },
    );

    /// 通知を受け取れる画面範囲
    final notifiedShell = ShellRoute(
      routes: [
        signIn,
        signedInShell,
      ],
      builder: (_, __, child) {
        return NotifiedShell(
          builder: (_) => child,
        );
      },
    );

    /// メンテナンス中は見れない画面範囲
    final appMaintShell = ShellRoute(
      routes: [
        notifiedShell,
      ],
      builder: (_, __, child) {
        return AppMaintShell(
          builder: () => child,
        );
      },
    );

    /// 新しいアプリにバージョンアップしないと見れない画面範囲
    final appUpdatedShell = ShellRoute(
      routes: [
        appMaintShell,
      ],
      builder: (_, __, child) {
        return AppUpdatedShell(
          builder: (_) => child,
        );
      },
    );

    /// スプラッシュ画面が終わらないと見れない画面範囲
    final splashCompletedShell = ShellRoute(
      routes: [
        appUpdatedShell,
      ],
      builder: (_, __, child) {
        return SplashCompletedShell(
          builder: () => child,
        );
      },
    );

    return GoRouter(
      initialLocation: PagePath.home.path,
      debugLogDiagnostics: false,
      routes: [
        splashCompletedShell,
      ],
    );
  },
);
