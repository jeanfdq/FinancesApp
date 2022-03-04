import 'package:financeapp/factories/usecases/remote_home_fetch_transactions_factory.dart';
import 'package:financeapp/presentation/home_presenter.dart';

import '../usecases/remote_home_delete_transaction_factory.dart';

HomePresenter makeHomePresenter() => HomePresenter(
      fetchAllTransactions: makeRemoteHomeFetchTransactions(),
      deleteTransaction: makeRemoteDeleteTransaction(),
    );
