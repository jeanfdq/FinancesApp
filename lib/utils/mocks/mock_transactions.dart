
import '../../models/transaction.dart';

List<Transaction> MockTransaction(){

    final List<Transaction> list = [];

    list.add(Transaction(type: TransactionType.debit , title: "Jogo Playstation", subTitle: "Entretenimento", value: 112));
    list.add(Transaction(type: TransactionType.debit , title: "Lavagem do Carro", subTitle: "Carro", value: 60));
    list.add(Transaction(type: TransactionType.credit , title: "Recebimento dívida", subTitle: "Outros", value: 500));
    list.add(Transaction(type: TransactionType.debit , title: "PetShop", subTitle: "Pets", value: 190.50));
    list.add(Transaction(type: TransactionType.credit , title: "Dividendos", subTitle: "Outros", value: 845));
    list.add(Transaction(type: TransactionType.debit , title: "Supermercado", subTitle: "Supermercado", value: 1200));
    list.add(Transaction(type: TransactionType.debit , title: "Internet", subTitle: "Mensal", value: 112));
    list.add(Transaction(type: TransactionType.credit , title: "Salário", subTitle: "Empresa xyz", value: 15200));
    list.add(Transaction(type: TransactionType.debit , title: "Condominio", subTitle: "Casa", value: 500));

    return list;

}