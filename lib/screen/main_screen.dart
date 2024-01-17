import 'package:expanse_tracker/component/chart.dart';
import 'package:expanse_tracker/component/expense_list.dart';
import 'package:expanse_tracker/models/expense.dart';
import 'package:expanse_tracker/screen/add_screen.dart';
import 'package:flutter/material.dart';

import '../component/custom_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<MainScreen> {
  void addNewExpense(Expense expense) {
    setState(() {
      widget.expenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      widget.expenses.remove(expense);
    });
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddScreen(
        addNewExpense: addNewExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widget.expenses.sort((expense1, expense2) =>
        expense1.dateTime.compareTo(expense2.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Overview",
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ),
        actions: [
          IconButton(
            onPressed: _openBottomSheet,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(250, 255, 250, 250)),
        child: Column(
          children: [
            Chart(expenses: widget.expenses),
            ExpenseList(
              expenses: widget.expenses,
              removeExpense: removeExpense,
            )
          ],
        ),
      ),
    );
  }
}
