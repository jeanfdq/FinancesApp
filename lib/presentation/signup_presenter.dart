
import 'package:financeapp/domain/usecases/login/register_with_login.dart';
import 'package:financeapp/screens/home.dart';
import 'package:get/get.dart';

class SignUpPresenter extends GetxController {
  SignUpPresenter({required this.registerWithEmail} );

  RegisterWithEmail registerWithEmail;

  String _fullName = "";
  String _email = "";
  String _password = "";

  RxBool showNameInvalid = false.obs;
  RxBool showEmailInvalid = false.obs;
  RxBool showPasswordInvalid = false.obs;
  RxBool enabledButton = false.obs;
  RxBool showRegisterFailed = false.obs;

  void onChangeName(String name){
    _fullName = name;
    _checkNameValid();
    _enabledSignUpButton();
  }

  void onChangeEmail(String email){
    _email = email;
    _checkEmailValid();
    _enabledSignUpButton();
  }

  void onChangePassword(String password){
    _password = password;
    _checkPasswordValid();
    _enabledSignUpButton();

  }

  void _checkNameValid() => showNameInvalid.value = _fullName.length < 3;
  void _checkEmailValid() => showEmailInvalid.value = !GetUtils.isEmail(_email);
  void _checkPasswordValid() => showPasswordInvalid.value = _password.length < 6;
  void _enabledSignUpButton() => enabledButton.value = !showNameInvalid.value && _fullName.isNotEmpty && !showEmailInvalid.value && _email.isNotEmpty && !showPasswordInvalid.value && _password.isNotEmpty;


  void onRegisterWithEmail() async {
    final user = await registerWithEmail.execRegister(name: _fullName, email: _email, password: _password);
    if (user == null) {
      showRegisterFailed.value = true;
    } else {
      Get.offAndToNamed(Home.id);
    }
  }

}