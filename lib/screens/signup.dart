import 'package:financeapp/components/rounded_button.dart';
import 'package:financeapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/custom_textfield.dart';
import '../services/firebase/firebase_services.dart';
import '../utils/functions/show_snackbar.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Para deixar a tela fullscreen----------------------------------------
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
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
                  padding: const EdgeInsets.only(left: 18, bottom: 40),
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
                  CustomTextField(
                    width: widthFields,
                    keyboard: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    hint: "Nome completo",
                    controller: _fullNameController,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
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
                      label: "Sign Up",
                      buttonBackgroundColor: primaryColor,
                      width: widthFields,
                      callback: () async {
                        
                        final firebaseUser = await registerLogin(
                            name: _fullNameController.text,
                            email: _emailController.text,
                            password: _passwordController.text);

                        firebaseUser == null
                            ? showSnackBar(context, message: "Algo deu errado!")
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