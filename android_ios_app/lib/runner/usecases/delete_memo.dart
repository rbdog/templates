import 'package:my_app/runner/notifiers/memo_list_notifier.dart';
import 'package:my_app/core/types/analytics_event.dart';
import 'package:my_app/runner/interfaces/firebase.dart';
import 'package:my_app/runner/interfaces/logger.dart';

/// メモを削除する
class DeleteMemoUsecase {
  DeleteMemoUsecase({
    required this.logger,
    required this.listNotifier,
    required this.firebase,
  });
  final Logger logger;
  final MemoListNotifier listNotifier;
  final FirebaseService firebase;

  /// メモを削除する
  Future<void> deleteMemo(String id) async {
    logger.debug('DeleteMemoUsecase.deleteMemo()');

    // Firebaseにイベントを報告する
    firebase.sendEvent(AnalyticsEvent.deleteMemo);

    // リストから削除して状態を変更
    listNotifier.delete(id);
  }
}
