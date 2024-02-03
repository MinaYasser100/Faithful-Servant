import 'package:get/get.dart';

String? fatherOfConessionValidator(value) {
  if (value!.isEmpty) {
    return 'Please, enter your father of confession'.tr;
  }
  return null;
}
