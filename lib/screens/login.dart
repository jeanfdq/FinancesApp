import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:financeapp/components/dialog.dart';
import 'package:financeapp/components/rounded_button.dart';
import 'package:financeapp/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/custom_textfield.dart';
import '../services/firebase/firebase_login_services.dart';

class Login extends StatelessWidget {
  Login({Key? key, required this.callback}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final Function(User?) callback;
  @override
  Widget build(BuildContext context) {
    // Para deixar a tela fullscreen----------------------------------------
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    final screenWidth = MediaQuery.of(context).size.width;
    final widthFields = screenWidth * 0.8;

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
                  CustomTextField(
                    autoFocus: true,
                    width: widthFields,
                    keyboard: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    hint: "Informe seu e-mail",
                    controller: _emailController,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    width: widthFields,
                    keyboard: TextInputType.number,
                    hint: "Informe sua senha",
                    isSecurity: true,
                    controller: _passwordController,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: ButtonRounded(
                      label: "Log In",
                      buttonBackgroundColor: primaryColor,
                      width: widthFields,
                      callback: () async {
                        final errorMessage = await execLogin(
                            email: _emailController.text,
                            password: _passwordController.text);

                        errorMessage != null
                            ? dialogAwesome(
                                context,
                                DialogType.INFO,
                                "Log In",
                                errorMessage,
                                btnOk: () {},
                              ).show()
                            : Navigator.popAndPushNamed(context, "/home");
                      },
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
