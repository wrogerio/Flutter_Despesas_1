// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({required this.transactions, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tr = transactions[index];
          return Card(
            color: Colors.blue[100],
            elevation: 3,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "R\$ ${tr.value.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purple[600]),
                  ),
                  decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('dd MMM y HH:mm:ss').format(tr.date),
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
