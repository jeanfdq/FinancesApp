
class TransactionFinance {
  final String id;
  final TransactionType type;
  final String title;
  final String category;
  final double value;

  TransactionFinance({
    required this.id,
    required this.type,
    required this.title,
    required this.category,
    required this.value,
  });
}

enum TransactionType {
  debit, credit
}

extension ToString on TransactionType {
  
  String toLiteralString() {

    switch (this) {
      case TransactionType.credit: return "Crédito";
      default: return "Débito";
    }
  }
}
