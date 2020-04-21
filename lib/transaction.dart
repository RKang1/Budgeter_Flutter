import 'package:flutter/material.dart';

class Transaction {
  final DateTime date;
  final String description;
  final double amount;

  const Transaction({
    @required this.date,
    @required this.description,
    @required this.amount,
  })  : assert(date != null),
        assert(description != null),
        assert(amount != null);
}