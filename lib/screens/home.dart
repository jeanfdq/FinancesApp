import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:financeapp/components/dialog.dart';
import 'package:financeapp/components/pie_chart2.dart';
import 'package:financeapp/models/transaction.dart';
import 'package:financeapp/screens/profile.dart';
import 'package:financeapp/screens/transaction_form.dart';
import 'package:financeapp/screens/transaction_item.dart';
import 'package:financeapp/services/firebase/firebase_transaction_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/center_progress_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<TransactionFinance> listTransactions = [];

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
                          dialogAwesome(
                            context,
                            DialogType.QUESTION,
                            FirebaseAuth.instance.currentUser?.displayName ??
                                "Logout",
                            'Deseja realmente sair do app...',
                            btnCancel: () {},
                            btnOk: () async {
                              await FirebaseAuth.instance
                                  .signOut()
                                  .whenComplete(
                                    () => Navigator.popAndPushNamed(
                                        context, "/welcome"),
                                  );
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
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TransactionForm()))
                    .then((value) {
                  _atualizaState();
                });
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          pieChart(context, 300, screenSize.width),
          Expanded(
            child: FutureBuilder<List<TransactionFinance>>(
              initialData: const [],
              future: fetchAllTransactions(),
              builder: ((context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Container();

                  case ConnectionState.waiting:
                    return const CenterProgressIndicator();

                  case ConnectionState.active:
                    return Container();

                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      final listTransactions =
                          snapshot.data as List<TransactionFinance>;
                      return ListView.builder(
                          itemCount: listTransactions.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onLongPress: () {
                                dialogAwesome(
                                  context,
                                  DialogType.QUESTION,
                                  "Deletar Transaction!",
                                  "Deseja realmente deletar essa transação?",
                                  btnCancel: () {},
                                  btnOk: () async {
                                    await deleteTransaction(listTransactions[index].id).whenComplete(() => _atualizaState());

                                  },
                                ).show();
                              },
                              child: TransactionItem(
                                  transaction: listTransactions[index]),
                            );
                          });
                    } else {
                      dialogAwesome(
                        context,
                        DialogType.ERROR,
                        "Ops, Algo deu errado!",
                        'Verifique sua conexão e tente novamente!',
                        btnCancel: () {},
                      ).show();
                      return Container();
                    }

                  default:
                    return Container();
                }
              }),
            ),
          ),
        ],
      ),
    );
  }

  void _atualizaState() {
    setState(() {
      
    });
  }

}
