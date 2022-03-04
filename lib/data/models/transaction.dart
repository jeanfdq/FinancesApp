
import '../../domain/entities/transaction_entity.dart';

class TransactionFinance {
  final String id;
  final TransactionType type;
  final String title;
  final String category;
  final double value;
  final String userId;

  TransactionFinance({
    required this.id,
    required this.type,
    required this.title,
    required this.category,
    required this.value,
    required this.userId
  });
}
