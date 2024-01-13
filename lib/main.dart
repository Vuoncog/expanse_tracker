import 'package:expanse_tracker/models/expense.dart';
import 'package:expanse_tracker/screen/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainScreen(
      expenses: [
        Expense("Banh mi", 19.99, DateTime.now(), Category.food),
        Expense("Tra sua", 10.99, DateTime.now(), Category.drink),
      ],
    ),
  ));
}
