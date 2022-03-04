
import 'package:financeapp/domain/entities/transaction_entity.dart';
import 'package:financeapp/domain/usecases/home/home_insert_transaction.dart';
import 'package:financeapp/screens/home.dart';
import 'package:get/get.dart';

import '../domain/usecases/utils/user_services.dart';

class TransactionFormPresenter {
  TransactionFormPresenter({required this.insertTransaction, required this.userID});

  InsertTransaction insertTransaction;
  CurrentUserID userID;

  onBack(){
    Get.offAndToNamed(Home.id);
  }

  Future<bool> onRegisterTransaction(TransactionEntity transaction) async {
    return  await insertTransaction.register(transaction);
  }

  String onGetUserID(){
    return userID.getUserID();
  }

}