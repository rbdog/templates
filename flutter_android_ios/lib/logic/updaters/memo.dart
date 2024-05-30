import 'package:my_app/logic/types/memo.dart';
import 'package:my_app/logic/types/status.dart';

/// メモの更新ルールを担当するクラス
class MemoUpdater {
  const MemoUpdater();

  /// ステータスを次に進める
  Memo switchStatus(Memo memo) {
    final next = switch (memo.status) {
      Status.todo => Status.doing, // 予定 => 進行中
      Status.doing => Status.done, // 進行中 => 完了
      Status.done => Status.todo, // 完了 => 予定(戻す)
    };
    // ステータスを変更してメモを返す
    return memo.copyWith(status: next);
  }

  /// 書かれた文字を上書きして更新する
  Memo updateText(Memo memo, String newText) {
    return memo.copyWith(
      text: newText,
    );
  }
}
