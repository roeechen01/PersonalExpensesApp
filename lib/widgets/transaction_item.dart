import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function removeTx;

  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.removeTx,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: FittedBox(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('\$${transaction.amount.toString()}'),
          )),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 500
            ? FlatButton.icon(
                onPressed: () => removeTx(transaction.id),
                icon: Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: const Text('Delete'))
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => removeTx(transaction.id),
              ),
      ),
    );
  }
}
