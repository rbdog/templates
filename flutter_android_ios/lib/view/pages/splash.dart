// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/app_init_result.dart';
import '../../state/providers/app_init_result.dart';
import '../logger.dart';
import '../router/go_router.dart';
import '../router/page_path.dart';

/// スプラッシュ画面
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ログ
    viewLogger.info('スプラッシュ画面をビルドします');

    /// 初期化の進捗を監視
    ref.listen(
      appInitResultProvider,
      (_, asyncResult) {
        final result = asyncResult.value;
        if (result == null) return;
        viewLogger.info('初期化完了を検知しました');

        switch (result) {
          case AppInitResult.forceUpdate:
            viewLogger.warn('スプラッシュ画面中に強制アップデートが検知されました');
            break;
          case AppInitResult.signedOut:
            viewLogger.info('サインイン画面へ移動します');
            final router = ref.read(goRouterProvider);
            router.goNamed(PageId.signIn.name);
            break;
          case AppInitResult.signedIn:
            viewLogger.info('ホーム画面へ移動します');
            final router = ref.read(goRouterProvider);
            router.goNamed(PageId.home.name);
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
