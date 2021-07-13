import 'package:flutter/material.dart';

class NewTransacrion extends StatefulWidget {
  final Function addFunc;

  NewTransacrion(this.addFunc);

  @override
  _NewTransacrionState createState() => _NewTransacrionState();
}

class _NewTransacrionState extends State<NewTransacrion> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void addTransaction() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0) return;

    widget.addFunc(titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => addTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: amountController,
              onSubmitted: (_) => addTransaction(),
            ),
            FlatButton(
                onPressed: addTransaction,
                child: Text('Add Transaction'),
                textColor: Colors.purple),
          ],
        ),
      ),
    );
  }
}
