
class Transaction {
  final TransactionType type;
  final String title;
  final String subTitle;
  final double value;

  Transaction({
    required this.type,
    required this.title,
    required this.subTitle,
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
