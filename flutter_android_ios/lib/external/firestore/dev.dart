import 'package:my_app/logic/features/logger.dart';
import 'package:my_app/logic/interfaces/firestore.dart';
import 'package:my_app/logic/types/memo.dart';
import 'package:my_app/logic/types/status.dart';

/// devフレーバー用の Firestore
class DevFirestore implements Firestore {
  @override
  Future<List<Memo>> findMemosByUserId(String userId) async {
    logger.info('firestoreからメモを取得します');
    await Future.delayed(const Duration(seconds: 1));
    logger.info('firestoreからメモを取得しました');
    return [
      const Memo(
        id: 'xxxx-example-01-xxxx',
        status: Status.todo,
        text: 'バナナを買う',
      ),
      const Memo(
        id: 'xxxx-example-02-xxxx',
        status: Status.doing,
        text: 'バナナを食べる',
      ),
      const Memo(
        id: 'xxxx-example-03-xxxx',
        status: Status.done,
        text: 'バナナを捨てる',
      ),
    ];
  }
}
