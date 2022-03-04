
import 'package:financeapp/factories/usecases/remote_login_with_email_factory.dart';
import 'package:financeapp/presentation/login_presenter.dart';

LoginPresenter makeLoginPresenter() {
  return LoginPresenter(loginWithEmail: makeRemoteLoginWithEmail());
}