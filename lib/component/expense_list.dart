import 'package:expanse_tracker/component/expense_card.dart';
import 'package:expanse_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: expenses.length,
      itemBuilder: (context, index) =>
          ExpenseCard(expense: expenses[index]),
    );
  }
}
