import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_item.dart';
import 'package:intl/intl.dart' as intl;
import '../models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  final Function removeTx;

  TransactionsList(this.transactions, this.removeTx);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Container(
            margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
            decoration: BoxDecoration(),
            child: transactions.isNotEmpty
                ? ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (ctx, index) {
                      return TransactionItem(
                          transaction: transactions[index], removeTx: removeTx);
                    },
                  )
                : Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'No transactions added!',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: constraints.maxHeight * 0.6,
                            child: Image.asset(
                              'assets/images/waiting.png',
                              fit: BoxFit.fill,
                            ),
                          )
                        ]),
                  )));
  }
}
