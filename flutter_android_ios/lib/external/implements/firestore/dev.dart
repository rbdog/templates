// Project imports:
import '../../interfaces/firestore.dart';
import '../../logger.dart';
import '../../../logic/types/status.dart';
import '../../../logic/types/todo.dart';

/// devフレーバー用の Firestore
class DevFirestore implements Firestore {
  @override
  Future<List<Todo>> findTodosByUserId(String userId) async {
    externalLogger.info('firestoreからTodoを取得します');
    await Future.delayed(const Duration(seconds: 1));
    externalLogger.info('firestoreからTodoを取得しました');
    return [
      const Todo(
        id: 'xxxx-example-01-xxxx',
        status: Status.todo,
        text: 'バナナを買う',
      ),
      const Todo(
        id: 'xxxx-example-02-xxxx',
        status: Status.doing,
        text: 'バナナを食べる',
      ),
      const Todo(
        id: 'xxxx-example-03-xxxx',
        status: Status.done,
        text: 'バナナを捨てる',
      ),
    ];
  }
}
