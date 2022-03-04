import 'package:financeapp/factories/presentation/transaction_form_presenter_factory.dart';
import 'package:financeapp/screens/transaction_form.dart';

TransactionForm makeTransactionFormScreen() => TransactionForm(presenter: makeTransactionFormPresenter(),);