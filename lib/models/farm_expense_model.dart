import 'package:farm_expenses/utils/enums.dart';
import 'package:flutter/material.dart';

class FarmExpenseModel {
  final String date;
  final ExpenseType type;
  final String amount;
  final String expenseType;
  FarmExpenseModel(
      {@required this.amount,
      @required this.date,
      @required this.expenseType,
      @required this.type});
}
