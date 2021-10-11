// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final _title = _titleController.text;
    final _value = double.tryParse(_valueController.text) ?? 0.0;

    if (_title.isEmpty || _value <= 0) {
      return;
    }

    widget.onSubmit(_title, _value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 30)),
      lastDate: DateTime.now(),
    ).then(
      (dt) => {
        setState(() {
          _selectedDate = dt!;
        })
      },
    );
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
              controller: _titleController,
              decoration: InputDecoration(labelText: "Titulo"),
            ),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(labelText: "Valor: R\$"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (v) => _submitForm(),
            ),
            Container(
              height: 100,
              child: Row(children: [
                Expanded(child: Text('Data selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}')),
                ElevatedButton(
                  onPressed: _showDatePicker,
                  child: Text('Selecionar'),
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                )
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => _submitForm(),
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                  child: Text(
                    'Adicionar despesa',
                    style: TextStyle(color: Colors.white),
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
