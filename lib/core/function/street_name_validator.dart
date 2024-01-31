String? streetNameValidator(value) {
  if (value!.isEmpty) {
    return "Please, enter your street name!";
  }
  return null;
}
