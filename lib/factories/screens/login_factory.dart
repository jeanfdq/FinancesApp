
import 'package:financeapp/factories/presentation/login_presenter_factory.dart';
import 'package:financeapp/screens/login.dart';

Login makeLoginScreen() {
  return Login(presenter: makeLoginPresenter() );
}