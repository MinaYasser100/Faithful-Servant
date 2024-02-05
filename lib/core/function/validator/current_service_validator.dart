String? currentServiceValidator(value) {
  if (value!.isEmpty) {
    return 'Please, enter your current service in 2023/2024';
  }
  return null;
}
