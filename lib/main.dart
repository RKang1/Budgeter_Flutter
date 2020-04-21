import 'package:flutter/material.dart';

import 'income_screen.dart';

void main() => runApp(BudgeterApp());

class BudgeterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Budgeter',
      home: IncomeScreen(),
    );
  }
}