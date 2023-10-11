import 'package:my_app/core/features/memo_creator.dart';
import 'package:my_app/core/config/memo.dart';
import 'package:my_app/runner/notifiers/memo_list_notifier.dart';
import 'package:my_app/core/types/analytics_event.dart';
import 'package:my_app/runner/interfaces/firebase.dart';
import 'package:my_app/runner/interfaces/logger.dart';

/// メモを追加する
class AddMemoUsecase {
  AddMemoUsecase({
    required this.logger,
    required this.listNotifier,
    required this.firebase,
  });
  final Logger logger;
  final MemoListNotifier listNotifier;
  final FirebaseService firebase;

  /// 新しいメモをリストに追加する
  Future<void> addNewMemo() async {
    logger.debug('AddMemoUsecase.addNewMemo()');
    // Firebaseにイベントを報告する
    firebase.sendEvent(AnalyticsEvent.addNewMemo);

    // ドメインを呼んで新しいメモを作成
    final creator = MemoCreater(
      defaultText: memoConfig.defaultText,
    );
    final memo = creator.createNewMemo();

    // リストに追加して状態を変更
    listNotifier.add(memo);
  }
}
