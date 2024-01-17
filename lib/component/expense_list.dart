import 'package:expanse_tracker/component/expense_card.dart';
import 'package:expanse_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.removeExpense,});

  final void Function(Expense expense) removeExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: expenses.length,
      itemBuilder: (context, index) =>
          Dismissible(
            key: ValueKey(expenses[index].id),
            onDismissed: (direction){
              removeExpense(expenses[index]);
            },
            child: ExpenseCard(expense: expenses[index]),
          ),
    );
  }
}
