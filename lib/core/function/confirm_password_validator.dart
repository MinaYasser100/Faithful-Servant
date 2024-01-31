String? confirmPasswordValidator(String? value, String originalPassword) {
  if (value == null || value.isEmpty) {
    return 'Please enter the confirm password.';
  }

  // Check if the entered password matches the original password
  if (value != originalPassword) {
    return 'Passwords do not match.';
  }

  // Return null if the input is valid
  return null;
}
