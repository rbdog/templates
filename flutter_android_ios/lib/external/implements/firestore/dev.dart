import 'package:my_app/external/logger.dart';
import 'package:my_app/external/interfaces/firestore.dart';
import 'package:my_app/logic/types/todo.dart';
import 'package:my_app/logic/types/status.dart';

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
