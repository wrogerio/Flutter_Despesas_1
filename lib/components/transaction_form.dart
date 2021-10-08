// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  _submitForm() {
    final _title = titleController.text;
    final _value = double.tryParse(valueController.text) ?? 0.0;

    if (_title.isEmpty || _value <= 0) {
      return;
    }

    widget.onSubmit(_title, _value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Titulo"),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(labelText: "Valor: R\$"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (v) => _submitForm(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => _submitForm(),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'Adicionar despesa',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple[600]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
