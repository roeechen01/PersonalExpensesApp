import 'package:flutter/material.dart';

class NewTransacrion extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addFunc;

  NewTransacrion(this.addFunc);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
                onPressed: () => addFunc(
                    titleController.text, double.parse(amountController.text)),
                child: Text('Add Transaction'),
                textColor: Colors.purple),
          ],
        ),
      ),
    );
  }
}
