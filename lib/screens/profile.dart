import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:financeapp/components/rounded_button.dart';
import 'package:financeapp/presentation/profile_presenter.dart';
import 'package:financeapp/utils/extensions/ext_color.dart';
import 'package:financeapp/utils/functions/screen_size.dart';
import 'package:flutter/material.dart';
import '../components/dialog.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key, required this.presenter}) : super(key: key);

  static const id = "/Profile";

  final ProfilePresenter presenter;

  @override
  Widget build(BuildContext context) {
    final widthButton = getScreenSize(context).width;

    final userName = presenter.onGetCurrentUser()?.displayName ?? "No User";
    final userEmail = presenter.onGetCurrentUser()?.email ?? "No User";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(userName),
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: presenter.onBack,
        ),
      ),
      body: Column(
        children: [
          Card(
            elevation: 3,
            child: ListTile(
              leading: const Text(
                "Nome: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                userName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Card(
            elevation: 3,
            child: ListTile(
              leading: const Text(
                "E-mail: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                userEmail,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ButtonRounded(
              label: "Logout",
              buttonBackgroundColor: HexColor.fromHex("#e57373"),
              width: widthButton,
              callback: () {
                dialogAwesome(
                  context,
                  DialogType.QUESTION,
                  "Sign Out",
                  "Deseja realmente sair do sistema?",
                  btnCancel: () {},
                  btnOk: presenter.onSignOut,
                ).show();
              },
            ),
          ),
        ],
      ),
    );
  }
}
