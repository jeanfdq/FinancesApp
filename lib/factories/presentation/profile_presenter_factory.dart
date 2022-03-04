
import 'package:financeapp/factories/usecases/remote_current_user_factory.dart';
import 'package:financeapp/factories/usecases/remote_login_signout_factory.dart';
import 'package:financeapp/presentation/profile_presenter.dart';

ProfilePresenter makeProfilePresenter() => ProfilePresenter(loginSignOut: makeRemoteLoginSignOut(), currentUser: makeRemoteCurrentUser(), );