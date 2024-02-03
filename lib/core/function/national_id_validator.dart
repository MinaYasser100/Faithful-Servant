import 'package:get/get.dart';

String? nationalIdValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your National ID'.tr;
  }
  String idDigits = value.replaceAll(RegExp(r'[^0-9]'), '');
  if (idDigits.length != 14) {
    return 'National ID should contain 14 digits'.tr;
  }
  return null;
}
