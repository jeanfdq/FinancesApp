import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../domain/entities/transaction_entity.dart';
import '../utils/extensions/ext_color.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem({Key? key, required this.transaction}) : super(key: key);

  final TransactionEntity transaction;
  final currency =
      NumberFormat.currency(locale: "pt_BR", decimalDigits: 2, symbol: "R\$");

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(
          Icons.monetization_on_outlined,
          color: transaction.type == TransactionType.debit
              ? Colors.red
              : Colors.green,
        ),
        title: Text(transaction.title),
        subtitle: Text(transaction.category),
        trailing: Container(
          width: 110,
          height: 30,
          decoration: BoxDecoration(
            color: transaction.type == TransactionType.debit
                ? Color.alphaBlend(HexColor.fromHex("ffcccb"), Colors.red)
                : Color.alphaBlend(HexColor.fromHex("c8e6c9"), Colors.green),
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          child: Center(
              child: Text(
            currency.format(transaction.value),
            style: TextStyle(
                color: transaction.type == TransactionType.debit
                    ? Colors.red
                    : Colors.green,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
