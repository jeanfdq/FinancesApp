import 'package:financeapp/domain/usecases/login/login_signout.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RemoteLoginSignOut extends LoginSignOut {
  @override
  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}