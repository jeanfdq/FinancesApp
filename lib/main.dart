import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:financeapp/screens/welcome.dart';
import 'package:financeapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const FinancesApp());

class FinancesApp extends StatelessWidget {
  const FinancesApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      home: EasySplashScreen(
        logo: Image.asset(imagesName[ImagesId.logoTipo]!),
        logoSize: 120,
        title: Text(
          "Finances App",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        showLoader: false,
        navigator: const Welcome(),
        durationInSeconds: 3,
      ),
    );
  }
}
