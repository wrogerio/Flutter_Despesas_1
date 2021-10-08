// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:despesas_pessoais/components/transaction_list.dart';
import 'package:despesas_pessoais/components/transaction_user.dart';
import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  const DespesasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
                  alignment: Alignment.center,
                  child: Text('Despesas', style: TextStyle(color: Colors.white, fontSize: 35)),
                ),
                elevation: 2,
              ),
            ),
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
