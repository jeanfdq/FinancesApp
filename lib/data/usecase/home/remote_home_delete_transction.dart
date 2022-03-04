
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financeapp/domain/usecases/home/home_delete_transaction.dart';

class RemoteDeleteTransaction extends DeleteTransaction {

  @override
  Future<void> execDelete(String id) async {
    
    final transactionRef = FirebaseFirestore.instance.collection("transactions");
    await transactionRef.doc(id).delete();

  }

}