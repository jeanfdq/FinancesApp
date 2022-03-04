import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/usecases/login/login_with_email.dart';

class RemoteLoginWithEmail extends LoginWithEmail {
  @override
  Future<String?> execLogin(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return null;
    } catch (e) {
      final msg = e.toString();

      if (msg.contains("The email address is badly formatted")) {
        return "Insira um e-mail válido!";
      }

      if (msg.contains(
          "There is no user record corresponding to this identifier. The user may have been deleted")) {
        return "Usuário não encontrado na base de dados!";
      }

      if (msg.contains(
          "The password is invalid or the user does not have a password")) {
        return "Usuário / Senha inválido!";
      }
    }
    return null;
  }
}
