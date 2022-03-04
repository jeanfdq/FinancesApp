

import 'package:financeapp/domain/entities/transaction_entity.dart';
import 'package:financeapp/screens/profile.dart';
import 'package:financeapp/screens/transaction_form.dart';
import 'package:get/get.dart';

import '../domain/usecases/home/home_delete_transaction.dart';
import '../domain/usecases/home/home_fetch_transactions.dart';

class HomePresenter {
  HomePresenter({required this.fetchAllTransactions, required this.deleteTransaction});


  FetchAllTransactions fetchAllTransactions;
  DeleteTransaction deleteTransaction;

  void onLoginSignOut() => Get.offAndToNamed(Profile.id);
  void onAddTransaction() => Get.offAndToNamed(TransactionForm.id);

  Future<List<TransactionEntity>> onFetchAll() async {
      List<TransactionEntity> list = [];
     list = await fetchAllTransactions.fetchAll() ;
     return list;
  }

  onDeleteTransaction(String id) async {
    await deleteTransaction.execDelete(id);
  }

}