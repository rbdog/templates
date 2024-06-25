// Project imports:

// Project imports:
import '../../logic/user/types/user.dart';
import 'interface.dart';

/// prd
class ImplPrd implements UserApi {
  @override
  Future<User?> getUser({required String id}) async {
    throw UnimplementedError();
  }
}
