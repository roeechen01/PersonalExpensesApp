import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart.dart';
import './models/transactions.dart';
import './widgets/new_transaction.dart';
import './widgets/transacrions_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
          fontFamily: 'Quicksans',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.amber),
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

  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where(
            (e) => e.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'Clothes',
      amount: 80,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: '2',
      title: 'Animals',
      amount: 242,
      date: DateTime.now().subtract(Duration(days: 5)),
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
      _userTransactions.add(tx);
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
            Chart(_recentTransactions),
            TransactionsList(_userTransactions)
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
