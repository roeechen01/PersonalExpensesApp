import 'package:flutter/material.dart';
import './transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 29.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Groceries', amount: 55, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.lightBlue,
                child: Text('CHART!'),
                elevation: 10,
              ),
            ),
            Column(
              children: transactions
                  .map((tx) => Card(
                        child: Text(tx.title),
                      ))
                  .toList(),
            )
          ],
        ));
  }
}
