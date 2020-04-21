import 'package:budgeter/balance_summary.dart';
import 'package:budgeter/transaction_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_transaction_screen.dart';
import 'transaction.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen();

  @override
  State<StatefulWidget> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {

  //todo
  _addIncome() {
//    print("_addIncome() executed");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTransactionScreen()),
    );
  }

  //todo
  void _openIncome(Transaction transaction) {
    print("_openIncome() executed");
  }

  //Build the widgets on the home screen
  Widget _buildIncomeWidgets(double sum, List<Transaction> transactions) {
    return Column(
      children: <Widget>[
        BalanceSummary(amount: sum),
        Flexible(
          child: Container(
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Transaction transactionItem = transactions[index];
                    return TransactionTile(
                      transaction: transactionItem,
                      onTap: _openIncome,
                    );
                  },
                  itemCount: transactions.length,
                ),
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final transactions = <Transaction>[];

    //Loop to create test data
    int month = 0, day;
    for (int i = 0; i < 48; i++) {
      if (i % 2 == 0) {
        month++;
        day = 1;
      } else {
        day = 15;
      }

      transactions.add(Transaction(
        date: DateTime(2020, month, day),
        description: 'Paycheck',
        amount: 1900.00,
      ));
    }

    //Sum of the transactions
    final double sum =
        transactions.fold(0, (sum, transaction) => sum + transaction.amount);

    final incomeWidgets = Container(
      child: _buildIncomeWidgets(sum, transactions),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Budgeter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
    );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: incomeWidgets,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _addIncome();
        },
      ),
    );
  }
}
