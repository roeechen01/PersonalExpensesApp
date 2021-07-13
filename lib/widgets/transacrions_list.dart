import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      height: 400,
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.purple, width: 2, style: BorderStyle.solid)),
      child: SingleChildScrollView(
        child: Column(
          children: transactions
              .map((tx) => Card(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.purple,
                                  style: BorderStyle.solid,
                                  width: 2)),
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Text(
                            '\$${tx.amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tx.title.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                DateFormat('dd/MM/yyyy').format(tx.date),
                                style: TextStyle(color: Colors.grey),
                              )
                            ])
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
