import 'package:get/get.dart';

String? addressOfAreaValidator(value) {
  if (value!.isEmpty) {
    return "Please, enter your area of name!".tr;
  }
  return null;
}
