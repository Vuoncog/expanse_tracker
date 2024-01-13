import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  final id = uuid.v4();
  final String title;
  final double expense;
  final DateTime dateTime;
  final Category category;

  Expense(this.title, this.expense, this.dateTime, this.category);
}

enum Category {
  food(
    Icons.fastfood_rounded,
    Color.fromARGB(255, 255, 171, 125),
    Color.fromARGB(255, 234, 115, 55),
  ),
  drink(
    Icons.local_cafe_rounded,
    Color.fromARGB(255, 147, 183, 255),
    Color.fromARGB(255, 81, 112, 180),
  ),
  leisure(
    Icons.beach_access_rounded,
    Color.fromARGB(255, 176, 255, 179),
    Color.fromARGB(255, 76, 176, 78),
  ),
  transportation(
    Icons.emoji_transportation_rounded,
    Color.fromARGB(255, 178, 160, 255),
    Color.fromARGB(255, 93, 71, 157),
  );

  final IconData icon;
  final Color containerColor;
  final Color iconColor;

  const Category(this.icon, this.containerColor, this.iconColor);
}
