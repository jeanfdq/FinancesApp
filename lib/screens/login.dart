import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:financeapp/components/dialog.dart';
import 'package:financeapp/components/rounded_button.dart';
import 'package:financeapp/presentation/login_presenter.dart';
import 'package:financeapp/utils/constants.dart';
import 'package:financeapp/utils/functions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../components/custom_textfield.dart';

class Login extends StatelessWidget {
  Login({Key? key, required this.presenter}) : super(key: key);
  
  static const String id = '/login';

  final LoginPresenter presenter;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Para deixar a tela fullscreen----------------------------
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    //----------------------------------------------------------
    final screenWidth = getScreenSize(context).width;
    final widthFields = screenWidth * 0.8;

    presenter.showLoginFailed.listen( (failed) => failed ? _showLoginFailedDialog(context) : presenter.showLoginFailed.value = false );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, bottom: 40, top: 40),
                  child: InkWell(
                    child: const Icon(Icons.arrow_back_ios),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            Container(
              width: screenWidth,
              padding: const EdgeInsets.only(left: 40, bottom: 30),
              child: Text(
                "Log In",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => CustomTextField(
                      autoFocus: true,
                      width: widthFields,
                      keyboard: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      hint: "Informe seu e-mail",
                      onChanged: presenter.onEmailChanged,
                      controller: _emailController,
                      errorText: presenter.showEmailInvalid.value
                          ? "E-mail inválido!"
                          : null,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => CustomTextField(
                      width: widthFields,
                      keyboard: TextInputType.number,
                      hint: "Informe sua senha",
                      onChanged: presenter.onPasswordChanged,
                      isSecurity: true,
                      controller: _passwordController,
                      errorText: presenter.showPasswordInvalid.value
                          ? "Senha inválida!"
                          : null,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Obx(
                      () => ButtonRounded(
                        label: "Log In",
                        buttonBackgroundColor:
                            presenter.loginButtonIsEnabled.value
                                ? primaryColor
                                : primaryLightColor,
                        width: widthFields,
                        callback: presenter.loginButtonIsEnabled.value
                            ? presenter.onLoginWithEmail
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showLoginFailedDialog(BuildContext context) {
    dialogAwesome(
      context,
      DialogType.INFO,
      "Log In",
      presenter.errorTextLogin?.value ?? "",
      btnOk: () {},
    ).show();
  }
}