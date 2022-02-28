import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:financeapp/components/pie_chart2.dart';
import 'package:financeapp/utils/extensions/ext_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../components/bar_chart.dart';
import '../components/pie_chart.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finances App'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              child: const Icon(Icons.logout),
              onTap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.QUESTION,
                  headerAnimationLoop: false,
                  animType: AnimType.SCALE,
                  title: FirebaseAuth.instance.currentUser?.displayName ??
                      "Logout",
                  desc: 'Deseja realmente sair do app...',
                  buttonsTextStyle: const TextStyle(color: Colors.black),
                  showCloseIcon: false,
                  btnCancelOnPress: () {},
                  btnOkOnPress: () async {
                    await FirebaseAuth.instance
                        .signOut()
                        .whenComplete(() => Navigator.pop(context));
                  },
                ).show();
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            pieChart2(context, 300, screenSize.width),
            RoundedCard.get(
              context,
              60,
              backgroundColor: Colors.white,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text(
                    "Seu Gastos...",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
