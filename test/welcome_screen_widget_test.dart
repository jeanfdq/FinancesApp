import 'package:financeapp/components/rounded_button.dart';
import 'package:financeapp/factories/presentation/welcome_presenter_factory.dart';
import 'package:financeapp/factories/screens/login_factory.dart';
import 'package:financeapp/factories/screens/signup_factory.dart';
import 'package:financeapp/screens/login.dart';
import 'package:financeapp/screens/signup.dart';
import 'package:financeapp/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  final welcomeScreen = GetMaterialApp(
    home: Welcome(presenter: makeWelcomePresenter()),
    getPages: [
      GetPage(name: Login.id, page: makeLoginScreen),
      GetPage(name: SignUp.id, page: makeSignUpScreen),
    ],
  );
  testWidgets("Deve conter uma imagem central", (tester) async {
    await tester.pumpWidget(welcomeScreen);
    final centerImage = find.byType(Image);
    expect(centerImage, findsOneWidget);
  });

  testWidgets("deve conter 3 Texts na tela", (tester) async {
    await tester.pumpWidget(welcomeScreen);
    final texts = find.byType(Text);
    expect(texts, findsNWidgets(3));
  });

  testWidgets("Deve conter um label de boas vindas ao app", (tester) async {
    await tester.pumpWidget(welcomeScreen);
    final textWelcome = find.text("Bem-vindo ao\n Finance App");
    expect(textWelcome, findsOneWidget);
  });

  testWidgets("Deve conter um botao de login", (tester) async {
    await tester.pumpWidget(welcomeScreen);
    final loginButton = find.widgetWithText(ButtonRounded, "Log In");
    expect(loginButton, findsOneWidget);
  });

  testWidgets("Deve conter um botao de signup", (tester) async {
    await tester.pumpWidget(welcomeScreen);
    final loginButton = find.widgetWithText(ButtonRounded, "Sign Up");
    expect(loginButton, findsOneWidget);
  });

  testWidgets("Deve conter dois botoes rounded na tela", (tester) async {
    await tester.pumpWidget(welcomeScreen);
    // final textwelcome = find.widgetWithText(Text, "Bem-vindo ao\n Finance App");
    final buttons = find.byType(ButtonRounded);
    expect(buttons, findsNWidgets(2));
  });

  testWidgets("Deve apresentar a tela de Login ao clicar no botao Login",
      (tester) async {
    await tester.pumpWidget(welcomeScreen);
    final loginButton = find.widgetWithText(ButtonRounded, "Log In");
    expect(loginButton, findsOneWidget);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    final loginScreen = find.byType(Login);
    expect(loginScreen, findsOneWidget);
  });

  testWidgets("Deve apresentar a tela de SignUp ao clicar no botao SignUp",
      (tester) async {
    await tester.pumpWidget(welcomeScreen);
    await tester.tap(find.widgetWithText(ButtonRounded, "Sign Up"));
    await tester.pumpAndSettle();
    expect(find.byType(SignUp), findsOneWidget);
  });

}
