import 'package:financeapp/domain/usecases/login/login_signout.dart';
import 'package:financeapp/factories/screens/home_factory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../domain/usecases/utils/user_services.dart';

class ProfilePresenter {
  ProfilePresenter({required this.loginSignOut, required this.currentUser});

  LoginSignOut loginSignOut;
  CurrentUser currentUser;

  void onSignOut() {
    loginSignOut.signOut();
    Get.back();
  }

  void onBack() {
    Get.off(() => makeHomeScreen());
  }

  User? onGetCurrentUser() {
    return currentUser.getUser();
  }
}
