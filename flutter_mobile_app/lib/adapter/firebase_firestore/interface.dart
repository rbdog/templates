import '../../logic/todo/index.dart';

/// Firebase Firestore
abstract interface class FirebaseFirestore {
  /// ユーザーIDでTodoを取得
  Future<List<Todo>> findTodosByUserId(String userId);
}
