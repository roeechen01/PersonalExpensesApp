import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/adaptive_flat_button.dart';
import 'package:intl/intl.dart';

class NewTransacrion extends StatefulWidget {
  final Function addFunc;

  NewTransacrion(this.addFunc);

  @override
  _NewTransacrionState createState() => _NewTransacrionState();
}

class _NewTransacrionState extends State<NewTransacrion> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime _datePicked;

  void addTransaction() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0 ||
        _datePicked == null) return;

    print('hi');
    widget.addFunc(
        titleController.text, double.parse(amountController.text), _datePicked);
    Navigator.of(context).pop();
  }

  void startPickDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((datePicked) {
      setState(() {
        this._datePicked = datePicked;
        addTransaction();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                left: 10,
                right: 10,
                top: 10),
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Row(children: [
                    Expanded(
                      child: Text(_datePicked != null
                          ? DateFormat.yMMMEd().format(_datePicked)
                          : 'No date picked!'),
                    ),
                    AdaptiveFlatButton('Choose a date', startPickDate)
                  ]),
                ),
                RaisedButton(
                    onPressed: addTransaction,
                    child: Text('Add Transaction'),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
