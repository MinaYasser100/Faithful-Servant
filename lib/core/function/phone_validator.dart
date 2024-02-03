import 'package:get/get.dart';

String? phoneValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your phone number'.tr;
  }
  String phoneDigits = value.replaceAll(RegExp(r'[^0-9]'), '');
  if (phoneDigits.length != 11) {
    return 'Phone number should contain 11 digits'.tr;
  }
  return null;
}
