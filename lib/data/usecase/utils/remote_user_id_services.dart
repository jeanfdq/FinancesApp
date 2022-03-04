
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/usecases/utils/user_services.dart';

class RemoteUserIDServices extends CurrentUserID {

  @override
  String getUserID() {
    return FirebaseAuth.instance.currentUser?.uid ?? "";
  }

}