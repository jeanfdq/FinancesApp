
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/usecases/utils/user_services.dart';

class RemoteCurrentUser extends CurrentUser {

  @override
  User? getUser() {
    return FirebaseAuth.instance.currentUser;
  }

}