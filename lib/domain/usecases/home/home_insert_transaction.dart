
import 'package:financeapp/domain/entities/transaction_entity.dart';

abstract class InsertTransaction {
  Future<bool> register(TransactionEntity transaction);
}