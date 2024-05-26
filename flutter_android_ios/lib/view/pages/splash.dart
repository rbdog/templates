import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/features/logger.dart';
import 'package:my_app/logic/types/app_init_result.dart';
import 'package:my_app/state/providers/app_init_result.dart';
import 'package:my_app/view/router/go_router.dart';
import 'package:my_app/view/router/page_path.dart';

/// スプラッシュ画面
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 初期化の進捗を監視
    ref.listen(
      appInitResultProvider,
      (_, asyncResult) {
        final result = asyncResult.value;
        if (result == null) return;
        logger.info('初期化完了を検知しました');

        switch (result) {
          case AppInitResult.immidiateUpdate:
            logger.warn('スプラッシュ画面中に強制アップデートが検知されました');
            break;
          case AppInitResult.signedOut:
            logger.info('サインイン画面へ移動します');
            final router = ref.read(goRouterProvider);
            router.goNamed(PageId.signIn.routeName);
            break;
          case AppInitResult.signedIn:
            logger.info('ホーム画面へ移動します');
            final router = ref.read(goRouterProvider);
            router.goNamed(PageId.home.routeName);
            break;
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('スプラッシュ画面'),
      ),
      body: const Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
