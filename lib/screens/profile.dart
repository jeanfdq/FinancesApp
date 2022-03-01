import 'package:financeapp/components/rounded_button.dart';
import 'package:financeapp/services/firebase/firebase_login_services.dart';
import 'package:financeapp/utils/extensions/ext_color.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({Key? key, required this.callback}) : super(key: key);

  final userName = getCurrentUser()?.displayName ?? "No User";
  final userEmail = getCurrentUser()?.email ?? "No User";
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final widthButton = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(userName),
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
              callback: callback,
            ),
          )
        ],
      ),
    );
  }
}
