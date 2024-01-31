String? numberOfHomeValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number.';
  }

  // Define a regular expression for a single digit
  RegExp singleDigitRegex = RegExp(r'^\d$');

  // Check if the input matches the required pattern
  if (!singleDigitRegex.hasMatch(value)) {
    return 'Please enter exactly one number.';
  }

  // Return null if the input is valid
  return null;
}
