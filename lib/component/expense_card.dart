import 'package:expanse_tracker/component/custom_text.dart';
import 'package:expanse_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/Utils.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final String formatted = formatter.format(expense.dateTime);

    return Card(
      color: expense.category.containerColor,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: expense.title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: "${expense.expense.toStringAsFixed(2)}\$",
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  expense.category.icon,
                  size: 32,
                  color: expense.category.iconColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: Color.fromARGB(255, 42, 42, 42),
                    ),

                    const SizedBox(
                      width: 8,
                    ),
                    CustomText(
                      text: formatted,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
