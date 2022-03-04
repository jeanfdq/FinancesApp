import 'package:financeapp/domain/usecases/login/register_with_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RemoteRegisterLoginWithEmail extends RegisterWithEmail {
  
  @override
  Future<User?> execRegister(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      await user!.updateDisplayName(name);
      return user;
    } catch (error) {
      return null;
    }
  }
}
