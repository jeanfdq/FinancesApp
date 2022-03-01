import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financeapp/models/transaction.dart';

Future<bool> registerTransaction(TransactionFinance transaction) async {
  final transactionRef = FirebaseFirestore.instance.collection("transactions");

  await transactionRef.doc(transaction.id).set({
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
  await transactionRef.get().then((QuerySnapshot querySnapshot) {
        for (var item in querySnapshot.docs) {
          final type = item["type"] == "Débito" ? TransactionType.debit : TransactionType.credit;
          final String title = item["title"];
          final String category = item["category"];
          final double value = item["value"];
            list.add( TransactionFinance(id: item.id, type: type, title: title, category: category, value: value) );
        }
    });

    return list;

}

void deleteTransaction(String id) async {

  //Sei que nao é legal mas é pq nao cadastrei 

  final transactionRef = FirebaseFirestore.instance.collection("transactions");
  await transactionRef.doc(id).delete();
  
}
