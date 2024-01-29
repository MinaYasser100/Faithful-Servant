String? emailValidator(value) {
  if (value!.isEmpty || !value.contains('@')) {
    return "Please, enter the email !";
  }
  return null;
}
