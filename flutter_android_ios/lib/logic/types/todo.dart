import 'package:my_app/logic/types/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    /// ID
    required String id,

    /// ステータス
    required Status status,

    /// 書かれた文字
    required String text,
  }) = _Todo;
}
