import 'package:financeapp/presentation/welcome_presenter.dart';
import 'package:financeapp/utils/constants.dart';
import 'package:financeapp/utils/functions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/rounded_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key, required this.presenter}) : super(key: key);

  static const id = "/Welcome";

  final WelComePresenter presenter;

  @override
  Widget build(BuildContext context) {
    // Para deixar a tela fullscreen---------------------------
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    //---------------------------------------------------------

    final screenWidth = getScreenSize(context).width;
    final imageWidht = screenWidth * 0.7;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagesName[ImagesId.logoTipo]!,
              width: imageWidht,
            ),
            SizedBox(
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bem-vindo ao\n Finance App",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ButtonRounded(
                    label: "Log In",
                    buttonBackgroundColor: primaryColor,
                    labelColor: Colors.white,
                    width: imageWidht,
                    callback: presenter.onGoToLogin,
                  ),
                  ButtonRounded(
                    label: "Sign Up",
                    buttonBackgroundColor: Colors.white,
                    labelColor: primaryColor,
                    width: imageWidht,
                    callback: presenter.onGoToSignUp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
