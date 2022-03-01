import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:financeapp/screens/home.dart';
import 'package:financeapp/screens/welcome.dart';
import 'package:financeapp/services/firebase/firebase_login_services.dart';
import 'package:financeapp/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FinancesApp());
}

class FinancesApp extends StatelessWidget {
  FinancesApp({
    Key? key,
  }) : super(key: key);

  final currentUser = getCurrentUser();

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
        navigator: currentUser == null ? const Welcome() : Home(),
        durationInSeconds: 3,
      ),
      routes: {
        "/welcome" : (_) => const Welcome(),
        "/home": (_) => Home(),
      },
    );
  }
}
