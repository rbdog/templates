// Project imports:

// Project imports:
import '../../logic/user/types/user.dart';
import 'interface.dart';

/// stg
class ImplStg implements UserApi {
  @override
  Future<User?> getUser({required String id}) async {
    throw UnimplementedError();
  }
}
