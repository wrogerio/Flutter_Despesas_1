// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

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
              keyboardType: TextInputType.phone,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => onSubmit(titleController.text, double.tryParse(valueController.text) ?? 0.0),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text(
                    'Nova Despesa',
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
