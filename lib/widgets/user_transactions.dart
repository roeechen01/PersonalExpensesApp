import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transacrions_list.dart';
import '../models/transactions.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 29.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Groceries', amount: 55, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [NewTransacrion(), TransactionsList(_transactions)]);
  }
}
