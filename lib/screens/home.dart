import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:financeapp/components/dialog.dart';
import 'package:financeapp/components/pie_chart2.dart';
import 'package:financeapp/presentation/home_presenter.dart';
import 'package:financeapp/screens/transaction_item.dart';
import 'package:financeapp/utils/constants.dart';
import 'package:financeapp/utils/functions/screen_size.dart';
import 'package:flutter/material.dart';
import '../components/center_progress_indicator.dart';
import '../domain/entities/transaction_entity.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.presenter}) : super(key: key);
  static const id = '/home';

  final HomePresenter presenter;

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final List<TransactionEntity> listTransactions = [];

  @override
  Widget build(BuildContext context) {
    final screenSize = getScreenSize(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finances App'),
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
          onTap: widget.presenter.onLoginSignOut,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              child: const Icon(Icons.add_circle),
              onTap: widget.presenter.onAddTransaction,
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
            child: FutureBuilder<List<TransactionEntity>>(
              initialData: const [],
              future: widget.presenter.onFetchAll(),
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
                          snapshot.data as List<TransactionEntity>;
                      return listTransactions.isNotEmpty
                          ? ListView.builder(
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
                                      btnOk: (){
                                        widget.presenter
                                          .onDeleteTransaction(
                                              listTransactions[index].id);
                                              _atualizaState();
                                      },
                                    ).show();
                                  },
                                  child: TransactionItem(
                                      transaction: listTransactions[index]),
                                );
                              })
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: primaryColor,
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  onTap: widget.presenter.onAddTransaction,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "Add Transação!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
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
    setState(() {});
  }
}
