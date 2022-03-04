import 'package:financeapp/domain/usecases/login/login_with_email.dart';
import 'package:financeapp/screens/home.dart';
import 'package:get/get.dart';

class LoginPresenter extends GetxController {
  LoginPresenter({required this.loginWithEmail});

  LoginWithEmail loginWithEmail;

  String _email = "";
  String _password = "";

  RxBool showEmailInvalid = false.obs;
  RxBool showPasswordInvalid = false.obs;
  RxBool loginButtonIsEnabled = false.obs;
  RxBool showLoginFailed = false.obs;
  RxString? errorTextLogin = "".obs;

  onEmailChanged(String email) {
    _email = email;
    checkEmail();
    _enabledLoginButton();
  }

  onPasswordChanged(String password) {
    _password = password;
    checkPassword();
    _enabledLoginButton();
  }

  void checkEmail() => showEmailInvalid.value = !GetUtils.isEmail(_email);
  void checkPassword() => showPasswordInvalid.value = _password.length < 6;
  void _enabledLoginButton() => loginButtonIsEnabled.value = !showEmailInvalid.value && !showPasswordInvalid.value && _email.isNotEmpty && _password.isNotEmpty;

  void onLoginWithEmail() async {
    final errorTextLogin = await  loginWithEmail.execLogin(email: _email, password: _password);
    if (errorTextLogin != null) {
      showLoginFailed.value = true;
    } else {
      Get.offAndToNamed(Home.id);
    }

  }

}
