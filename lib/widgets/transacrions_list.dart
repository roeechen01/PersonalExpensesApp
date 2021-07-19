import 'package:flutter/material.dart';
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
                      return Card(
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 8),
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
                          trailing: MediaQuery.of(context).size.width > 500
                              ? FlatButton.icon(
                                  onPressed: () =>
                                      removeTx(transactions[index].id),
                                  icon: Icon(Icons.delete),
                                  textColor: Theme.of(context).errorColor,
                                  label: Text('Delete'))
                              : IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Theme.of(context).errorColor,
                                  onPressed: () =>
                                      removeTx(transactions[index].id),
                                ),
                        ),
                      );
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
