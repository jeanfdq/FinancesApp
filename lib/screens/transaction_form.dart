import 'package:financeapp/components/rounded_button.dart';
import 'package:financeapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Transação"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ListTile(
              leading: getLabel("Tipo:"),
              trailing: DropdownButton(
                value: _currentType,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
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
                    child: customTextField(TextInputType.name,
                        "Lavagem de Carros", _titleController),
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
                      child: customTextField(TextInputType.name, "Supermercado",
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
                        TextInputType.name, "R\$ 150,16", _valueController),
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
            padding: const EdgeInsets.all(24.0),
            child: ButtonRounded(
              label: "Salvar transação",
              labelColor: Colors.black,
              buttonBackgroundColor: Colors.white,
              width: screenWidth,
              callback: () {},
            ),
          ),
        ],
      ),
    );
  }

  TextField customTextField(TextInputType keyboardType, String hint,
      TextEditingController controller) {
    return TextField(
      keyboardType: keyboardType,
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
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      contentPadding: const EdgeInsets.only(left: 100),
    );
  }

  TextStyle getHintStyle() => const TextStyle(color: Colors.white);

  Text getLabel(String text) => Text(
        text,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
