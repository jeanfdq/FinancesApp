import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:financeapp/components/rounded_button.dart';
import 'package:financeapp/presentation/signup_presenter.dart';
import 'package:financeapp/utils/constants.dart';
import 'package:financeapp/utils/functions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../components/custom_textfield.dart';
import '../components/dialog.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key, required this.presenter}) : super(key: key);
  static const id = "/signup";
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final SignUpPresenter presenter;

  @override
  Widget build(BuildContext context) {
    // Para deixar a tela fullscreen----------------------------
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    //----------------------------------------------------------
    final screenWidth = getScreenSize(context).width;
    final widthFields = screenWidth * 0.8;

    presenter.showRegisterFailed.listen( (failed) => failed ? _showRegisterFailed(context) : presenter.showRegisterFailed.value = false );

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
                "Sign Up",
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
                      width: widthFields,
                      keyboard: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      hint: "Nome completo",
                      controller: _fullNameController,
                      errorText: presenter.showNameInvalid.value
                          ? "Nome inválido!"
                          : null,
                      onChanged: presenter.onChangeName,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => CustomTextField(
                      width: widthFields,
                      keyboard: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      hint: "Informe seu e-mail",
                      controller: _emailController,
                      onChanged: presenter.onChangeEmail,
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
                      isSecurity: true,
                      controller: _passwordController,
                      onChanged: presenter.onChangePassword,
                      errorText: presenter.showPasswordInvalid.value
                          ? "Senha inválida!"
                          : null,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Obx(
                      () => ButtonRounded(
                        label: "Sign Up",
                        buttonBackgroundColor: presenter.enabledButton.value ? primaryColor : primaryLightColor,
                        width: widthFields,
                        callback: presenter.enabledButton.value ? presenter.onRegisterWithEmail : null,
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
}

_showRegisterFailed(BuildContext context) {
  dialogAwesome(
      context,
      DialogType.INFO,
      "Sign Up In",
      "Ops, ALgo deu errado!",
      btnOk: () {},
    ).show();
}


