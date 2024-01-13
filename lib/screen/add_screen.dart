import 'package:expanse_tracker/component/custom_text.dart';
import 'package:flutter/material.dart';

import '../utils/Utils.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddState();
  }
}

class _AddState extends State<AddScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
                text: _selectedDate == null ? "No date selected" : formatter.format(_selectedDate!),
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
              TextButton(
                onPressed: () {},
                child: const CustomText(
                  text: "Cancel",
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              FilledButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
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
