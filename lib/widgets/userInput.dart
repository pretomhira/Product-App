import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  final Function newProduct;

  UserInput(this.newProduct, {Key? key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();

  void submitData() {
    final enteredName = nameController.text;
    final enteredDescripion = descriptionController.text;
    final enteredQuantity = int.parse(quantityController.text);

    if (enteredName.isEmpty ||
        enteredDescripion.isEmpty ||
        enteredQuantity <= 0) {
      return;
    }

    widget.newProduct(enteredName, enteredDescripion, enteredQuantity);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Name'),
            controller: nameController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Description'),
            controller: descriptionController,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Quantity'),
            controller: quantityController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          // ignore: deprecated_member_use
          FlatButton(
              textColor: Colors.purple,
              onPressed: submitData,
              child: const Text('Add Transaction'))
        ],
      ),
    );
  }
}
