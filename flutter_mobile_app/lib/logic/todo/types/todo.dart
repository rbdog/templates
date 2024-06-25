// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'status.dart';

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
