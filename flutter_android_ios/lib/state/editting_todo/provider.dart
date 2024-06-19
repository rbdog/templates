// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/todo/types/todo.dart';
import 'notifier.dart';

typedef _Notifier = EdittingTodoNotifier;

/// 編集中Todoのプロバイダー
final edittingTodoProvider = NotifierProvider.family<_Notifier, Todo, String>(
  () {
    return EdittingTodoNotifier();
  },
);
