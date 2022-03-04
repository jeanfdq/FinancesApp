
import 'package:financeapp/factories/usecases/remote_insert_transaction_factory.dart';
import 'package:financeapp/presentation/transaction_form_presenter.dart';

import '../usecases/remote_user_id_service_factory.dart';

TransactionFormPresenter makeTransactionFormPresenter() => TransactionFormPresenter(insertTransaction: makeRemoteInsertTransaction(), userID: makeRemoteUserID(), );