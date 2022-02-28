import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:financeapp/components/pie_chart2.dart';
import 'package:financeapp/models/transaction.dart';
import 'package:financeapp/screens/profile.dart';
import 'package:financeapp/screens/transaction_form.dart';
import 'package:financeapp/screens/transaction_item.dart';
import 'package:financeapp/utils/mocks/mock_transactions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final List<Transaction> listTransactions = MockTransaction();

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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builderContext) => Profile(
                        callback: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.QUESTION,
                            headerAnimationLoop: false,
                            animType: AnimType.SCALE,
                            title: FirebaseAuth
                                    .instance.currentUser?.displayName ??
                                "Logout",
                            desc: 'Deseja realmente sair do app...',
                            buttonsTextStyle:
                                const TextStyle(color: Colors.black),
                            showCloseIcon: false,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () async {
                              await FirebaseAuth.instance
                                  .signOut()
                                  .whenComplete(() => Navigator.popAndPushNamed(context, "/welcome") ,);
                            },
                          ).show();
                        },
                      )),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              child: const Icon(Icons.add_circle),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionForm()));
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
              itemCount: listTransactions.length,
              itemBuilder: (context, index) {
                final transaction = listTransactions[index];

                return TransactionItem(transaction: transaction);
              },
            ),
          ),
        ],
      ),
    );
  }
}
