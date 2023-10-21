import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/core/types/memo.dart';
import 'package:my_app/runner/notifiers/editting_memo.dart';

typedef _Notifier = EdittingMemoNotifier;

/// 編集中メモのプロバイダー
final edittingMemoProvider = NotifierProvider.family<_Notifier, Memo, String>(
  () {
    return EdittingMemoNotifier();
  },
);
