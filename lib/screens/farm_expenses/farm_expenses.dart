import 'package:farm_expenses/models/farm_expense_model.dart';
import 'package:farm_expenses/screens/farm_expenses/farm_expenses_controller.dart';
import 'package:farm_expenses/screens/farm_expenses/widgets/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FarmExpenses extends StatelessWidget {
  final FarmExpensesController controller = FarmExpensesController();
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (ctx, orientation) {
        controller.setOrientation = orientation;
        return Scaffold(
            backgroundColor: Colors.white,
            body: orientation == Orientation.portrait
                ? _portraitView()
                : _landscapeView());
      },
    );
  }

  Widget _landscapeView() {
    return Column();
  }

  Widget _portraitView() {
    return Column(
      children: [
        _totals(),
        Expanded(
          child: _expenseList(),
        )
      ],
    );
  }

  Widget _totals() {
    return Container(
      width: Get.width,
      height: Get.height * .1,
      color: Colors.green.shade50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _totalIncomeExpense(
            amount: controller.totalIncome,
            income: true,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            height: Get.height * .06,
            width: 1,
            decoration: BoxDecoration(color: Colors.grey.shade300),
          ),
          _totalIncomeExpense(
            amount: controller.totalExpenses,
            income: false,
          )
        ],
      ),
    );
  }

  Widget _totalIncomeExpense({@required String amount, @required bool income}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(amount,
            style: TextStyle(
                color: income ? Colors.green : Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        Text(income ? "Total Income" : "Total Expenses",
            style: TextStyle(color: Colors.grey.shade800, fontSize: 12))
      ],
    );
  }

  Widget _expenseList() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Get.width * .05, vertical: 5),
          child: _titles(),
        ),
        Expanded(
          child: _list(),
        )
      ],
    );
  }

  Widget _list() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .025, vertical: 5),
      child: GetBuilder(
        init: controller,
        builder: (_) => ListView(physics: BouncingScrollPhysics(), children: [
          for (FarmExpenseModel model in controller.list) ExpenseCard(model)
        ]),
      ),
    );
  }

  Widget _titles() {
    TextStyle style = TextStyle(color: Colors.grey.shade800);
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: Get.width * .305,
              child: Text("Expenses Type", style: style)),
          Text("Amount", style: style),
          _btns(),
        ],
      ),
    );
  }

  Widget _btns() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(Icons.swap_vert), Icon(Icons.picture_as_pdf)],
    );
  }
}
