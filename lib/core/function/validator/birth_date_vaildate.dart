import 'package:get/get.dart';

String? birthDateVaildate(value) {
  if (value!.isEmpty) {
    return 'Please, enter your brith date'.tr;
  }
  return null;
}
