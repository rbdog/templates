import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/logic/types/todo.dart';
import 'package:my_app/state/notifiers/editting_todo.dart';

typedef _Notifier = EdittingTodoNotifier;

/// 編集中Todoのプロバイダー
final edittingTodoProvider = NotifierProvider.family<_Notifier, Todo, String>(
  () {
    return EdittingTodoNotifier();
  },
);
