// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import '../../logic/types/todo.dart';
import '../notifiers/editting_todo.dart';

typedef _Notifier = EdittingTodoNotifier;

/// 編集中Todoのプロバイダー
final edittingTodoProvider = NotifierProvider.family<_Notifier, Todo, String>(
  () {
    return EdittingTodoNotifier();
  },
);
