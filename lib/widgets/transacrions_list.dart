import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import '../models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
        height: 400,
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
                style: BorderStyle.solid)),
        child: !transactions.isEmpty
            ? ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  style: BorderStyle.solid,
                                  width: 2)),
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            '\$${this.transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(transactions[index].title.toString(),
                                  style: Theme.of(context).textTheme.headline6),
                              Text(
                                intl.DateFormat('dd/MM/yyyy')
                                    .format(transactions[index].date),
                                style: TextStyle(color: Colors.grey),
                              )
                            ])
                      ],
                    ),
                  );
                },
              )
            : Column(children: [
                Text(
                  'No transactions added!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.fill,
                  ),
                )
              ]));
  }
}
