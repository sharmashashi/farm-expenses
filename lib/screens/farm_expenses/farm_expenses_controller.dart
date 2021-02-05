import 'package:farm_expenses/models/farm_expense_model.dart';
import 'package:farm_expenses/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FarmExpensesController extends GetxController {
  FarmExpensesController() {
    refreshList();
  }
  Orientation _orientation;
  Orientation get orientation => _orientation;
  set setOrientation(Orientation orn) {
    _orientation = orn;
  }

  String totalIncome = "\u20b9 80,000";
  String totalExpenses = "\u20b9 20,000";

  List<FarmExpenseModel> list = List();

  refreshList() {
    for (int i = 0; i < 20; i++) {
      bool even = i % 2 == 0;
      list.add(FarmExpenseModel(
        date: "22 Oct 2020",
        amount: even ? "\u20b9 20,000" : "\u20b9 40,000",
        type: even ? ExpenseType.EXPENSE : ExpenseType.INCOME,
        expenseType: even ? "Labours" : "Machinery",
      ));
    }
    update();
  }
}
