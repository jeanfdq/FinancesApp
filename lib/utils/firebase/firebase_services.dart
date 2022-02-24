
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

Future<User?> execLogin ( {required String email, required String password}) async {

  try {
    final result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return result.user;
  } catch (e) {
    return null;
  }

}
