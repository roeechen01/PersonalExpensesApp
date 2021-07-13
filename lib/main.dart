import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transactions.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transacrions_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'Clothes',
      amount: 80,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Animals',
      amount: 242,
      date: DateTime.now(),
    )
  ];

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx2) {
          return GestureDetector(
            child: NewTransacrion(_addTransaction),
            behavior: HitTestBehavior.opaque,
            onTap: () {},
          );
        });
  }

  void _addTransaction(String txTile, double txAmount) {
    Transaction tx = Transaction(
        id: DateTime.now().toString(),
        title: txTile,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _transactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.lightBlue,
                child: Text('CHART!'),
                elevation: 10,
              ),
            ),
            TransactionsList(_transactions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
