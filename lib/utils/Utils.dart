import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat('dd-MM-yyyy');

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}