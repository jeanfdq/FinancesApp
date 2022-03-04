import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financeapp/domain/entities/transaction_entity.dart';
import 'package:financeapp/domain/usecases/home/home_fetch_transactions.dart';
import 'package:financeapp/factories/usecases/remote_user_id_service_factory.dart';

class RemoteHomeFetchAllTransactons extends FetchAllTransactions {
  @override
  Future<List<TransactionEntity>> fetchAll() async {
    final List<TransactionEntity> list = [];
    final transactionRef =
        FirebaseFirestore.instance.collection("transactions");
    await transactionRef
        .where("userID", isEqualTo: makeRemoteUserID().getUserID())
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var item in querySnapshot.docs) {
        final type = item["type"] == "Débito"
            ? TransactionType.debit
            : TransactionType.credit;
        final String title = item["title"];
        final String category = item["category"];
        final double value = item["value"];
        final String userID = item["userID"];
        list.add(TransactionEntity(
            id: item.id,
            type: type,
            title: title,
            category: category,
            value: value,
            userId: userID));
      }
    });
    return list;
  }
}
