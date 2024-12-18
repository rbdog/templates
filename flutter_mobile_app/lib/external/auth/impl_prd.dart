// Project imports:

// Project imports:
import '../../logic/credential/types/credential.dart';
import '../../logic/credential/types/sign_in_with.dart';
import 'interface.dart';

/// prdフレーバー用の Firebase Auth
class ImplPrd implements Auth {
  @override
  Stream<Credential?> watchCredential() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() {
    throw UnimplementedError();

    // しばらく待ってもらうための Completer
    // final completer = Completer<bool>();
    // // ストリームを一度のイベント分だけリッスン
    // late final StreamSubscription<User?> subs;
    // subs = dummyController.stream.listen((user) {
    //   subs.cancel();
    //   // 待ってもらっている相手に、完了を伝える
    //   final signedIn = user != null;
    //   completer.complete(signedIn);
    // });
    // return completer.future;
  }

  @override
  Future<void> signIn(SignInWith signInWith) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
