import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/ui/pages/edit.dart';
import 'package:my_app/ui/pages/list.dart';
import 'package:my_app/ui/router/page_path.dart';

/// Provide GoRouter
final goRouterProvider = Provider(
  (ref) {
    final routes = [
      GoRoute(
        path: PageId.list.path,
        name: PageId.list.routeName,
        builder: (context, state) {
          return const ListPage();
        },
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

    return GoRouter(
      initialLocation: PageId.list.path,
      debugLogDiagnostics: false,
      routes: routes,
    );
  },
);
