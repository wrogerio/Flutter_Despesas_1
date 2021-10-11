// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList({required this.transactions, required this.onRemove, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Image.asset('assets/images/waiting.png')
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text('${tr.value}'),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: TextStyle(fontFamily: 'Quicksand'),
                    ),
                    subtitle: Text(DateFormat('d MMM y').format(tr.date).toString()),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      onPressed: () => onRemove(tr.id),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
