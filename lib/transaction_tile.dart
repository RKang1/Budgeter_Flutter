import 'package:budgeter/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const _rowHeight = 60.0;
const _fontSize = 20.0;

class TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final ValueChanged<Transaction> onTap;

  const TransactionTile({
    Key key,
    @required this.transaction,
    this.onTap,
  })  : assert(transaction != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amber,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          highlightColor: Colors.orange,
          splashColor: Colors.amberAccent,
          onTap: () =>  onTap(transaction),
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  DateFormat('MM-dd-yyyy').format(transaction.date),
                  style: new TextStyle(fontSize: _fontSize),
                ),
                Text(
                  transaction.description,
                  style: new TextStyle(fontSize: _fontSize),
                ),
                Text(
                  transaction.amount.toString(),
                  style: new TextStyle(fontSize: _fontSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
