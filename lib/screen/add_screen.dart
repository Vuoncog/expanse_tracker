import 'package:expanse_tracker/component/custom_text.dart';
import 'package:expanse_tracker/models/expense.dart';
import 'package:flutter/material.dart';

import '../utils/Utils.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key, required this.addNewExpense});

  final void Function(Expense expense) addNewExpense;

  @override
  State<StatefulWidget> createState() {
    return _AddState();
  }
}

class _AddState extends State<AddScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _category = Category.food;

  void _showDatePicker() async {
    final DateTime today = DateTime.now();
    final firstDate = DateTime(today.year - 1, today.month, today.day);
    final pickDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: today,
      initialDate: today,
    );
    setState(() {
      _selectedDate = pickDate;
    });
  }

  void _setCategory(Category category) {
    setState(() {
      _category = category;
    });
  }

  void _addExpense() {
    final enterAmount = double.tryParse(_amountController.text);
    final isValidAmount = enterAmount == null || enterAmount <= 0;
    if (_selectedDate == null ||
        _titleController.text.trim().isEmpty ||
        isValidAmount) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const CustomText(
            text: "Error",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          content: const CustomText(
            text: "Please fill all text fields",
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const CustomText(
                  text: "OK",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ))
          ],
        ),
      );
    } else {
      widget.addNewExpense(
        Expense(
          _titleController.text,
          double.tryParse(_amountController.text)!,
          _selectedDate!,
          _category,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 56, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: CustomText(
                text: "Title",
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 128,
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: CustomText(
                      text: "Amount",
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    prefix: CustomText(
                      text: "\$ ",
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              CustomText(
                text: _selectedDate == null
                    ? "No date selected"
                    : formatter.format(_selectedDate!),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              IconButton(
                onPressed: _showDatePicker,
                icon: const Icon(Icons.date_range_rounded),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                value: _category,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: CustomText(
                            text: category.name.capitalize(),
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    _setCategory(value);
                  } else {
                    return;
                  }
                },
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const CustomText(
                  text: "Cancel",
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              FilledButton(
                onPressed: _addExpense,
                child: const CustomText(
                  text: "Add expense",
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
