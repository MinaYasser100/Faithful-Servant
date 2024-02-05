import 'package:get/get.dart';

String? streetNameValidator(value) {
  if (value!.isEmpty) {
    return "Please, enter your street name!".tr;
  }
  return null;
}
