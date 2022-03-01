
import 'package:firebase_auth/firebase_auth.dart';



Future<User?> registerLogin(
    {required String name, required String email, required String password}) async {
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

Future<String?> execLogin ( {required String email, required String password}) async {

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return null;
  } catch (e) {
    
    final msg = e.toString();

    if (msg.contains("The email address is badly formatted")) {
      return "Insira um e-mail válido!";
    }

    if (msg.contains("There is no user record corresponding to this identifier. The user may have been deleted")) {
      return "Usuário não encontrado na base de dados!";
    }

    if (msg.contains("The password is invalid or the user does not have a password")) {
      return "Usuário / Senha inválido!";
    }

    
  }
  return null;

}

User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;
}

String getUserID() {
  return FirebaseAuth.instance.currentUser?.uid ?? "";
}

