import '../../logic/todo/index.dart';
import 'interface.dart';

/// stgフレーバー用の Firestore
class ImplStg implements FirebaseFirestore {
  @override
  Future<List<Todo>> findTodosByUserId(String userId) {
    throw UnimplementedError();
  }
}
