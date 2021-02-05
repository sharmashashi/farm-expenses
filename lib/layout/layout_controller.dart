import 'package:farm_expenses/models/farm_expense_model.dart';
import 'package:farm_expenses/screens/farm_expenses/farm_expenses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  int _currentIndex = 3;
  int get currentIndex => _currentIndex;

  final List<Widget> tabs = [
    Container(),
    Container(),
    Container(),
    FarmExpenses()
  ];

  onTap(index) {
    _currentIndex = index;
    update();
  }
}
