import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financeapp/models/transaction.dart';

import 'firebase_login_services.dart';

Future<bool> registerTransaction(TransactionFinance transaction) async {
  final transactionRef = FirebaseFirestore.instance.collection("transactions");

  await transactionRef.doc(transaction.id).set({
    "userID": transaction.userId,
    "type": transaction.type.toLiteralString(),
        "title": transaction.title,
        "category": transaction.category,
        "value": transaction.value
  }).then((value){
    return true; 
  }).onError((error, stackTrace) {
    return false;
  });
  return true; 

}

Future<List<TransactionFinance>> fetchAllTransactions() async {

  final List<TransactionFinance> list = [];

  final transactionRef = FirebaseFirestore.instance.collection("transactions");
  await transactionRef.where("userID", isEqualTo: getUserID()).get().then((QuerySnapshot querySnapshot) {
        for (var item in querySnapshot.docs) {
          final type = item["type"] == "Débito" ? TransactionType.debit : TransactionType.credit;
          final String title = item["title"];
          final String category = item["category"];
          final double value = item["value"];
          final String userID = item["userID"];
            list.add( TransactionFinance(id: item.id, type: type, title: title, category: category, value: value, userId: userID ) );
        }
    });

    return list;

}

Future<void> deleteTransaction(String id) async {

  final transactionRef = FirebaseFirestore.instance.collection("transactions");
  await transactionRef.doc(id).delete();
  
}
