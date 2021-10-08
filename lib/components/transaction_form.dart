// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  TransactionForm({Key? key}) : super(key: key);

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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Titulo: ${titleController.text} , Valor: ${valueController.text}');
                  },
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
