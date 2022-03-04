
import 'package:financeapp/domain/entities/transaction_entity.dart';

abstract class FetchAllTransactions {
  Future<List<TransactionEntity>> fetchAll();
}