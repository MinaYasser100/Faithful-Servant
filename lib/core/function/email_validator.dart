import 'package:get/get.dart';

String? emailValidator(value) {
  if (value!.isEmpty || !value.contains('@')) {
    return "Please, enter your email !".tr;
  }
  return null;
}
