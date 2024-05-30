import 'package:my_app/logic/types/memo.dart';

/// メモが正しいかチェックするクラス
class MemoValidater {
  const MemoValidater({required this.maxLength});

  /// 最大文字数
  final int maxLength;

  /// メモの文字数をチェックする
  /// - true: ルールを満たしている OK
  /// - false: ルールを満たしていない NG
  bool validateLength(Memo memo) {
    return memo.text.length <= maxLength;
  }
}
