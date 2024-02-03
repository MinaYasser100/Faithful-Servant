import 'package:get/get.dart';

String? educationalQualificationValidator(value) {
  if (value!.isEmpty) {
    return 'Please, enter your educational qualification'.tr;
  }
  return null;
}
