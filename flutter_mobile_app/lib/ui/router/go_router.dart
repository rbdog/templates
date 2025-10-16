import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../pages/home.dart';
import '../pages/sign_in.dart';
import '../pages/todo_edit.dart';
import '../pages/todo_list.dart';
import 'app_maint_shell.dart';
import 'app_updated_shell.dart';
import 'notified_shell.dart';
import 'signed_in_shell.dart';
import 'splash_completed_shell.dart';

/// Provide GoRouter
final goRouterProvider = Provider((ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      // スプラッシュ画面が終わらないと見れない画面範囲
      ShellRoute(
        builder: (_, _, child) {
          return SplashCompletedShell(builder: () => child);
        },
        routes: [
          // 新しいアプリにバージョンアップしないと見れない画面範囲
          ShellRoute(
            builder: (_, _, child) {
              return AppUpdatedShell(builder: (_) => child);
            },
            routes: [
              // メンテナンス中は見れない画面範囲
              ShellRoute(
                builder: (_, _, child) {
                  return AppMaintShell(builder: () => child);
                },
                routes: [
                  // 通知を受け取れる画面範囲
                  ShellRoute(
                    builder: (_, _, child) {
                      return NotifiedShell(builder: (_) => child);
                    },
                    routes: [
                      // サインイン画面
                      GoRoute(
                        path: '/sign-in',
                        builder: (_, _) => const SignInPage(),
                      ),

                      // サインインしないと見れない画面範囲
                      ShellRoute(
                        builder: (_, _, child) {
                          return SignedInShell(builder: (_) => child);
                        },
                        routes: [
                          // ホーム画面
                          GoRoute(
                            path: '/',
                            builder: (_, _) => const HomePage(),
                          ),

                          // Todoリスト画面
                          GoRoute(
                            path: '/todos',
                            builder: (_, _) => const TodoListPage(),
                          ),

                          // Todo編集画面
                          GoRoute(
                            path: '/todos/:id/edit',
                            builder: (_, state) {
                              final id = state.pathParameters['id']!;
                              return TodoEditPage(id: id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
