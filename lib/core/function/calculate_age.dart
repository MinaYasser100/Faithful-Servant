import 'package:intl/intl.dart';

int calculateAge(String birthDate) {
  DateTime birthDateFormat = DateFormat('dd/MM/yyyy').parse(birthDate);
  DateTime toDay = DateTime.now();
  int age = toDay.year - birthDateFormat.year;
  if (toDay.month < birthDateFormat.month ||
      (toDay.month == birthDateFormat.month &&
          toDay.day < birthDateFormat.day)) {
    age--;
  }
  return age;
}
