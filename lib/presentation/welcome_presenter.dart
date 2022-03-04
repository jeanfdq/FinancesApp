
import 'package:financeapp/screens/login.dart';
import 'package:financeapp/screens/signup.dart';
import 'package:get/get.dart';

class WelComePresenter {
  void onGoToLogin() => Get.toNamed(Login.id);
  void onGoToSignUp() => Get.toNamed(SignUp.id);
}