import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import '../models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  final Function removeTx;

  TransactionsList(this.transactions, this.removeTx);

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
        child: transactions.isNotEmpty
            ? ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              '\$${transactions[index].amount.toString()}'),
                        )),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(intl.DateFormat.yMMMMd()
                          .format(transactions[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => removeTx(transactions[index].id),
                      ),
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
