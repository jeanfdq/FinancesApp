
import 'package:financeapp/screens/home.dart';
import '../presentation/home_presenter_factory.dart';

Home makeHomeScreen() => Home( presenter: makeHomePresenter() );