

import 'package:financeapp/domain/entities/transaction_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test("Deve devolver uma literal Credito quando é criada uma trasnacao", (){

    final transaction = TransactionEntity(id: "", type: TransactionType.credit, title: "title", category: "category", value: 100, userId: "userId");
    expect("Crédito", transaction.type.toLiteralString());

  });

  test("Deve devolver uma literal Debito quando é criada uma trasnacao", (){

    final transaction = TransactionEntity(id: "", type: TransactionType.debit, title: "title", category: "category", value: 100, userId: "userId");
    expect("Débito", transaction.type.toLiteralString());

  });
}