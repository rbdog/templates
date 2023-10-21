import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/config/memo.dart';
import 'package:my_app/logic/features/logger.dart';
import 'package:my_app/logic/features/memo_updater.dart';
import 'package:my_app/logic/features/memo_validater.dart';
import 'package:my_app/logic/types/memo.dart';
import 'package:my_app/state/providers/memo_list.dart';

/// 編集中メモを管理するノティファイヤ
class EdittingMemoNotifier extends FamilyNotifier<Memo, String> {
  EdittingMemoNotifier();

  @override
  Memo build(String arg) {
    final memos = ref.read(memoListProvider);
    return memos.value!.firstWhere((it) => it.id == arg);
  }

  /// ステータスを次に進める
  Future<void> editStatus() async {
    // ログ
    logger.info('ステータスを編集します');
    // ドメインを呼んでステータスを変更する
    const updater = MemoUpdater();
    final memo = updater.switchStatus(state);
    // 編集中のメモの状態を変更する
    state = memo;
  }

  /// メモの内容を編集する
  Future<void> editText(String newText) async {
    // ログ
    logger.info('テキストを編集します');
    // ドメインを呼んでステータスを変更する
    const updater = MemoUpdater();
    final memo = updater.updateText(
      state,
      newText,
    );
    // 編集中のメモの状態を変更する
    state = memo;
  }

  /// 編集した内容を保存する
  Future<void> save({
    required void Function() onValidateFailure,
    required void Function() onSuccess,
  }) async {
    // ログ
    logger.info('編集内容を保存します');
    // ドメインを呼んで内容をチェックする
    final validater = MemoValidater(
      maxLength: memoConfig.maxLength,
    );
    final ok = validater.validateLength(state);
    // ルール違反のときはダイアログを表示して終了
    if (!ok) {
      onValidateFailure();
      return;
    }
    // リスト一覧のメモを上書きして状態を変更
    final listNotifier = ref.read(memoListProvider.notifier);
    listNotifier.replace(state);
    // 成功を知らせる
    onSuccess();
  }
}
