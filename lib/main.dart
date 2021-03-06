// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:math';
import 'dart:ui';
import 'package:despesas_pessoais/components/chart.dart';
import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  const DespesasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'Quicksand'),
      supportedLocales: [Locale('pt', 'BR')],
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(id: 't0', title: 'Conta Antiga', value: 905.25, date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(id: 't1', title: 'Lápis 6b', value: 74.45, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(id: 't2', title: 'Caneta Esferográfica', value: 2.30, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(id: 't3', title: 'Conta Antiga', value: 905.25, date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(id: 't4', title: 'Lápis 6b', value: 74.45, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(id: 't5', title: 'Caneta Esferográfica', value: 2.30, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(id: 't6', title: 'Conta Antiga', value: 905.25, date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(id: 't7', title: 'Lápis 6b', value: 74.45, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(id: 't8', title: 'Caneta Esferográfica', value: 2.30, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(id: 't9', title: 'Conta Antiga', value: 905.25, date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(id: 't10', title: 'Lápis 6b', value: 74.45, date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(id: 't11', title: 'Caneta Esferográfica', value: 2.30, date: DateTime.now().subtract(Duration(days: 1))),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 6)));
    }).toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  _addTransaction(String title, double value, DateTime dt) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: dt,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Despesas Pessoais', style: TextStyle(fontFamily: 'Quicksand')),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        )
      ],
    );
    final availabelheight = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: availabelheight * 0.25,
            child: Chart(_recentTransactions),
          ),
          Container(
            height: availabelheight * 0.75,
            child: TransactionList(
              transactions: _transactions,
              onRemove: _removeTransaction,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
