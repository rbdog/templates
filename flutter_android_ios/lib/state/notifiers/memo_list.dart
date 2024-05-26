import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/config/memo.dart';
import 'package:my_app/logic/features/logger.dart';
import 'package:my_app/logic/features/memo_creator.dart';
import 'package:my_app/logic/types/analytics_event.dart';
import 'package:my_app/logic/types/memo.dart';
import 'package:my_app/state/providers/api.dart';

/// メモ一覧を管理するノティファイヤ
class MemoListNotifier extends AsyncNotifier<List<Memo>> {
  @override
  Future<List<Memo>> build() async {
    // ログ
    logger.info('メモ一覧を初期化します');
    // Firestore から取得
    final firestore = ref.read(firestoreProvider);
    final memos = await firestore.findMemosByUserId('TEST_USER_ID');
    return memos;
  }

  /// リストの一番末尾にメモを追加する
  void add() {
    // ログ
    logger.info('メモを追加します');

    // Firebaseにイベントを報告する
    final analytics = ref.read(analyticsProvider);
    analytics.sendEvent(AnalyticsEvent.addNewMemo);

    // ドメインを呼んで新しいメモを作成
    final creator = MemoCreater(
      defaultText: memoConfig.defaultText,
    );
    final memo = creator.createNewMemo();

    final newList = [...state.value!, memo];
    state = AsyncData(newList);
  }

  /// 指定されたIDのメモを削除する
  void delete(String id) {
    // ログ
    logger.info('メモを削除します');

    // Firebaseにイベントを報告する
    final analytics = ref.read(analyticsProvider);
    analytics.sendEvent(AnalyticsEvent.deleteMemo);

    final newList = List.of(state.value!);
    newList.removeWhere(
      (memo) => memo.id == id,
    );
    state = AsyncData(newList);
  }

  /// メモを上書きする
  void replace(Memo newMemo) {
    final newList = state.value!.map((it) {
      // id が一致したメモだけ新しい方を採用
      // それ以外はそのまま
      return it.id == newMemo.id ? newMemo : it;
    }).toList();
    state = AsyncData(newList);
  }
}
