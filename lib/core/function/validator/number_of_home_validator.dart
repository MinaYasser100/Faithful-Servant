import 'package:get/get.dart';

String? numberOfHomeValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number of home.'.tr;
  }
  // Return null if the input is valid
  return null;
}
