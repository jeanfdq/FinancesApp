import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog dialogAwesome(
    BuildContext context, DialogType type, String title, String description,
    {VoidCallback? btnOk, VoidCallback? btnCancel}) {
  return AwesomeDialog(
    context: context,
    dialogType: type,
    headerAnimationLoop: false,
    animType: AnimType.SCALE,
    title: title,
    desc: description,
    buttonsTextStyle: const TextStyle(color: Colors.black),
    showCloseIcon: false,
    btnCancelOnPress: btnCancel,
    btnOkOnPress: btnOk,
  );
}
