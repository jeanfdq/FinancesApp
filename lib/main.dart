import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:financeapp/factories/screens/home_factory.dart';
import 'package:financeapp/factories/screens/login_factory.dart';
import 'package:financeapp/factories/screens/profile_factory.dart';
import 'package:financeapp/factories/screens/signup_factory.dart';
import 'package:financeapp/factories/screens/transaction_form_factory.dart';
import 'package:financeapp/factories/screens/welcome_factory.dart';
import 'package:financeapp/screens/home.dart';
import 'package:financeapp/screens/login.dart';
import 'package:financeapp/screens/profile.dart';
import 'package:financeapp/screens/signup.dart';
import 'package:financeapp/screens/transaction_form.dart';
import 'package:financeapp/screens/welcome.dart';
import 'package:financeapp/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FinancesApp());
}

class FinancesApp extends StatelessWidget {
  FinancesApp({
    Key? key,
  }) : super(key: key);

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    return GetMaterialApp(
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
        navigator: currentUser == null ? makeWelcomeScreen() : makeHomeScreen(),
        durationInSeconds: 3,
      ),
      getPages: [
        GetPage(name: Welcome.id, page: makeWelcomeScreen),
        GetPage(name: Home.id, page: makeHomeScreen),
        GetPage(name: Login.id, page: makeLoginScreen),
        GetPage(name: Profile.id, page: makeProfileScreen),
        GetPage(name: SignUp.id, page: makeSignUpScreen),
        GetPage(name: TransactionForm.id, page: makeTransactionFormScreen),
      ],
    );
  }
}
