
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

  String getValue() {
    return value.toString().replaceAll(".", ",");
  }

}

enum TransactionType {
  credit,
  debit
}
