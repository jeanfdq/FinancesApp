
import 'package:financeapp/screens/welcome.dart';
import '../presentation/welcome_presenter_factory.dart';

Welcome makeWelcomeScreen() => Welcome( presenter: makeWelcomePresenter() );