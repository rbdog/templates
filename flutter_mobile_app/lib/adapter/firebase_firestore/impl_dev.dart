import '../../logic/debug/index.dart';
import '../../logic/todo/index.dart';
import 'interface.dart';

/// devフレーバー用の Firestore
class ImplDev implements FirebaseFirestore {
  const ImplDev({required this.logger});

  final Logger logger;

  @override
  Future<List<Todo>> findTodosByUserId(String userId) async {
    logger.info('firestoreからTodoを取得します');
    await Future.delayed(const Duration(seconds: 1));
    logger.info('firestoreからTodoを取得しました');
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
