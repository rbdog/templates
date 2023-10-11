import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/runner/providers/usecases.dart';
import 'package:my_app/runner/providers/api.dart';
import 'package:my_app/runner/providers/memo_list_provider.dart';
import 'package:my_app/ui/router/page_path.dart';
import 'package:my_app/ui/router/go_router.dart';
import 'package:my_app/ui/widgets/add_button.dart';
import 'package:my_app/ui/widgets/memo_card.dart';
import 'package:my_app/ui/theme/sizes.dart';
import 'package:my_app/ui/widgets/use_effect_view.dart';

/// 一覧画面
class ListPage extends ConsumerWidget {
  const ListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// logger
    final logger = ref.watch(loggerProvider);
    logger.debug('ListPage.build()');

    /// メモ一覧
    final memoList = ref.watch(memoListProvider);

    /// リスト
    final listView = ListView.builder(
      itemCount: memoList.length,
      itemBuilder: (context, index) {
        final memo = memoList[index];
        return MemoCard(
          memo: memoList[index],
          onPressed: () {
            // 編集画面へ進む
            final router = ref.read(goRouterProvider);
            router.pushNamed(
              PageId.edit.routeName,
              pathParameters: {'id': memo.id},
            );
          },
          onPressedDelete: () {
            // ユースケースを呼び出す
            final usecase = ref.read(deleteMemoProvider);
            usecase.deleteMemo(memo.id);
          },
        );
      },
    );

    /// 追加ボタン
    final addButton = AddButton(
      onPressed: () {
        // ユースケースを呼び出す
        final usecase = ref.read(addMemoProvider);
        usecase.addNewMemo();
      },
    );

    /// 画面レイアウト
    return Scaffold(
      floatingActionButton: addButton,
      body: UseEffectView(
        onAppear: () {
          // スプラッシュ画面がないのでここで初期化
          final usecase = ref.read(initAppProvider);
          usecase.execute();
        },
        child: Padding(
          padding: const EdgeInsets.all(RawSize.p4),
          child: listView,
        ),
      ),
    );
  }
}
