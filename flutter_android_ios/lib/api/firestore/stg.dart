import 'package:my_app/core/interfaces/firestore.dart';
import 'package:my_app/core/types/memo.dart';

/// stgフレーバー用の Firestore
class StgFirestore implements Firestore {
  @override
  Future<List<Memo>> findMemosByUserId(String userId) {
    throw UnimplementedError();
  }
}
