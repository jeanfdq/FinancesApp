import 'package:financeapp/components/rounded_button.dart';
import 'package:financeapp/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finances App'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ButtonRounded(
          label: "LogOut",
          buttonBackgroundColor: primaryColor,
          width: 150,
          callback: () {
            FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
