// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/todo/types/todo.dart';
import 'notifier.dart';

typedef _Notifier = EditingTodoNotifier;

/// 編集中Todoのプロバイダー
final editingTodoProvider = NotifierProvider.family<_Notifier, Todo, String>(
  () {
    return EditingTodoNotifier();
  },
);
