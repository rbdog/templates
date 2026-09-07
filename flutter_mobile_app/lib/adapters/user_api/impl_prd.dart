import '../../domain/user/index.dart';
import '../../ports/user_api.dart';

/// prd
class ImplPrd implements UserApi {
  @override
  Future<User?> getUser({required String id}) async {
    throw UnimplementedError();
  }
}
