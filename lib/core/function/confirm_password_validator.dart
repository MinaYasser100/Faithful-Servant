import 'package:get/get.dart';

String? confirmPasswordValidator(String? value, String originalPassword) {
  if (value == null || value.isEmpty) {
    return 'Please enter password again.'.tr;
  }

  // Check if the entered password matches the original password
  if (value != originalPassword) {
    return 'Passwords do not match.'.tr;
  }

  // Return null if the input is valid
  return null;
}
