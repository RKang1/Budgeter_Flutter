import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BalanceSummary extends StatelessWidget {
  final double amount;

  const BalanceSummary({
    Key key,
    @required this.amount,
  })  : assert(amount != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: Container(
        height: 80.0,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text(
                  amount.toString(),
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontSize: 40.0),
                ),
              ),
              Center(
                child: Text(
                  'Income (ytd)',
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
