import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'currency_input_formatter.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen();

  @override
  State<StatefulWidget> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateController.text = new DateFormat('MM-dd-yyyy').format(selectedDate);
      });
  }

  _saveTransaction() {
    print("_saveTransaction() executed");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Form(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: IgnorePointer(
                      child: TextFormField(
                        controller: dateController,
                        decoration: const InputDecoration(
                          labelText: 'Date',
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      CurrencyInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            _saveTransaction();
          },
        ),
      ),
    );
  }
}
