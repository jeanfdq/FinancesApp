
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterWithEmail {
  Future<User?> execRegister(
    {required String name, required String email, required String password});
}