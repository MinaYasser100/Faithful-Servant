import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DatePickerFormatter extends TextInputFormatter {
  final String _dateFormat = 'MM/dd/yyyy';

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final DateFormat formatter = DateFormat(_dateFormat);

    String formatted = formatter.format(DateTime.now());
    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
