import 'package:farm_expenses/models/farm_expense_model.dart';
import 'package:farm_expenses/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseCard extends StatelessWidget {
  final FarmExpenseModel model;
  ExpenseCard(this.model);
  final emptyBorder = BorderSide(
    color: Colors.transparent,
    width: 3,
  );
  final cardHeight = Get.height * .08;
  final double borderRadius = 5;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * .95,
      child: Center(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: Get.width * .9,
            height: cardHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(0.5, 0.5),
                    blurRadius: 1.5,
                    spreadRadius: 1)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _border(),
                Expanded(
                  flex: 15,
                  child: _details(),
                )
              ],
            )),
      ),
    );
  }

  Widget _border() {
    return Container(
      width: 4,
      height: cardHeight,
      decoration: BoxDecoration(
          color: model.type == ExpenseType.INCOME ? Colors.green : Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              bottomLeft: Radius.circular(borderRadius))),
    );
  }

  Widget _details() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        _expensesType(),
        _amount(),
        _optionBtn(),
      ],
    );
  }

  Widget _expensesType() {
    return Container(
      margin: EdgeInsets.only(left: Get.width * .05),
      width: Get.width * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(model.expenseType,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text(
            model.date,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget _amount() {
    return SizedBox(
      width: Get.width * .22,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              model.type == ExpenseType.INCOME
                  ? "Total Income"
                  : "Total Expenses",
              style: TextStyle(color: Colors.grey.shade800, fontSize: 12)),
          Text(model.amount,
              style: TextStyle(
                  color: model.type == ExpenseType.INCOME
                      ? Colors.green
                      : Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget _optionBtn() {
    return IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_vert_rounded, color: Colors.grey.shade400));
  }
}
