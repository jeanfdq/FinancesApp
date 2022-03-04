import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:financeapp/components/rounded_button.dart';
import 'package:financeapp/utils/extensions/ext_string.dart';
import 'package:financeapp/utils/functions/generate_uuid.dart';
import 'package:financeapp/utils/functions/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:form_validator/form_validator.dart';
import '../components/dialog.dart';
import '../domain/entities/transaction_entity.dart';
import '../presentation/transaction_form_presenter.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key, required this.presenter}) : super(key: key);
  static const id = "/transaction_form";

  final TransactionFormPresenter presenter;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final List<String> _types = [
    TransactionType.debit.toLiteralString(),
    TransactionType.credit.toLiteralString()
  ];

  final maskValue = MaskTextInputFormatter(
      mask: "R\$ ###,##", type: MaskAutoCompletionType.lazy);

  late List<DropdownMenuItem<String>> _dropDownMenuItems;
  late String _currentType;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentType = _dropDownMenuItems[0].value!;
    super.initState();
  }

  void _validate() {
    _form.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = getScreenSize(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Transação"),
        leading: InkWell(
          child: const Icon(Icons.arrow_back),
          onTap: widget.presenter.onBack,
        ),
      ),
      body: Form(
        key: _form,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: screenWidth,
                height: 45,
                child: ListTile(
                  leading: getLabel("Tipo:"),
                  trailing: DropdownButton(
                    value: _currentType,
                    items: _dropDownMenuItems,
                    onChanged: changedDropDownItem,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              leading: getLabel("Título:"),
              trailing: SizedBox(
                width: screenWidth * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: customTextField(
                          ValidationBuilder()
                              .minLength(2)
                              .maxLength(15)
                              .build(),
                          true,
                          TextInputType.name,
                          "Lavagem de Carros",
                          _titleController),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              leading: getLabel("Categoria:"),
              trailing: SizedBox(
                width: screenWidth * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                        child: customTextField(
                            ValidationBuilder()
                                .minLength(2)
                                .maxLength(15)
                                .build(),
                            null,
                            TextInputType.name,
                            "Supermercado",
                            _categoryController)),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.grey,
            ),
            ListTile(
              leading: getLabel("Valor:"),
              trailing: SizedBox(
                width: screenWidth * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: customTextField(
                          ValidationBuilder()
                              .minLength(1)
                              .maxLength(15)
                              .build(),
                          null,
                          TextInputType.number,
                          "R\$ 150,16",
                          _valueController),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ButtonRounded(
                label: "Salvar transação",
                labelColor: Colors.black,
                buttonBackgroundColor: Colors.white,
                width: screenWidth,
                callback: () async {
                  _validate();
                  final currentFormState =
                      _form.currentState?.validate() ?? false;

                  if (currentFormState) {
                    final id = generateUUId();

                    final transaction = TransactionEntity(
                      id: id,
                      type: _currentType == "Débito"
                          ? TransactionType.debit
                          : TransactionType.credit,
                      title: _titleController.text,
                      category: _categoryController.text,
                      value: _valueController.text.toDouble(),
                      userId: widget.presenter.onGetUserID(),
                    );
                    final isRegister = await widget.presenter
                        .onRegisterTransaction(transaction);
                    isRegister
                        ? widget.presenter.onBack()
                        : dialogAwesome(
                            context,
                            DialogType.ERROR,
                            "Ops, Algo deu errado!",
                            'Verifique os dados inseridos!',
                            btnCancel: () {},
                          ).show();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField customTextField(
    String? Function(String?)? validator,
    bool? autofocus,
    TextInputType keyboardType,
    String hint,
    TextEditingController controller,
  ) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      autofocus: autofocus ?? false,
      textCapitalization: TextCapitalization.words,
      textAlign: TextAlign.end,
      decoration: getInputDecoration(hint),
      style: const TextStyle(fontSize: 18),
      controller: controller,
    );
  }

  InputDecoration getInputDecoration(String hint) {
    return InputDecoration(
      labelText: hint,
      hintStyle: const TextStyle(
        fontStyle: FontStyle.italic,
      ),
      floatingLabelStyle: getHintStyle(),
      border: InputBorder.none,
      labelStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      contentPadding: const EdgeInsets.only(left: 100),
    );
  }

  TextStyle getHintStyle() => const TextStyle(color: Colors.white);

  Text getLabel(String text) => Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String type in _types) {
      items.add(DropdownMenuItem(value: type, child: Text(type)));
    }
    return items;
  }

  void changedDropDownItem(String? selectedCity) {
    setState(() {
      _currentType = selectedCity ?? "";
    });
  }
}
