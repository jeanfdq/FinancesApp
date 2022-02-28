import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:financeapp/components/pie_chart2.dart';
import 'package:financeapp/utils/extensions/ext_card.dart';
import 'package:financeapp/utils/extensions/ext_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        leading: InkWell(
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          onTap: (){},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              child: const Icon(Icons.add_circle),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          pieChart2(context, 300, screenSize.width),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.red,
                  ),
                  title: const Text("Title"),
                  subtitle: const Text("SubTitle"),
                  trailing: Container(
                    width: 95,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color.alphaBlend(
                          HexColor.fromHex("ffcccb"), Colors.red),
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                    ),
                    child: const Center(
                        child: Text(
                      "R\$ 1000,00",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
