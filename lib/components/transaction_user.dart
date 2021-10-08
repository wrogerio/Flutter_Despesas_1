import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({Key? key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transaction = [
    Transaction(id: 't1', title: 'Almoço', value: 20, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de Luz', value: 87.5, date: DateTime.now()),
    Transaction(id: 't3', title: 'Ração para Meg', value: 34, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(transactions: _transaction),
        TransactionForm(),
      ],
    );
  }
}
