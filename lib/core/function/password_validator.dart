String? passwordVaildator(value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value!.isEmpty) {
    return 'You must enter a password !';
  } else {
    if (!regex.hasMatch(value)) {
      return 'This password is weak !';
    } else {
      return null;
    }
  }
}
