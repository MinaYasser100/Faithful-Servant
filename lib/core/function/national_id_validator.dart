String? nationalIdValidator(value) {
  if (value!.isEmpty) {
    return 'Please enter your National ID';
  }
  String idDigits = value.replaceAll(RegExp(r'[^0-9]'), '');
  if (idDigits.length != 14) {
    return 'National ID should contain 14 digits';
  }
  return null;
}
