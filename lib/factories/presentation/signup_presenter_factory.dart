
import 'package:financeapp/factories/usecases/remote_register_login_with_email_factory.dart';
import 'package:financeapp/presentation/signup_presenter.dart';

SignUpPresenter makeSignUpPresenter() => SignUpPresenter(registerWithEmail: makeRemoteRegisterLoginWithEmail());