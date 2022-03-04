
import 'package:firebase_auth/firebase_auth.dart';

abstract class CurrentUser {
  User? getUser();
}

abstract class CurrentUserID {
  String getUserID();
}