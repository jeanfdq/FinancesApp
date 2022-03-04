import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financeapp/domain/entities/transaction_entity.dart';
import 'package:financeapp/domain/usecases/home/home_insert_transaction.dart';

class RemoteInsertTransaction extends InsertTransaction {
  @override
  Future<bool> register(TransactionEntity transaction) async {
    final transactionRef =
        FirebaseFirestore.instance.collection("transactions");

    await transactionRef.doc(transaction.id).set({
      "userID": transaction.userId,
      "type": transaction.type.toLiteralString(),
      "title": transaction.title,
      "category": transaction.category,
      "value": transaction.value
    }).then((value) {
      return true;
    }).onError((error, stackTrace) {
      return false;
    });
    return true;
  }
}
