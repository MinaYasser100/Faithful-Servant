String? durationvalidator(value) {
  if (value!.isEmpty) {
    return 'رجاء محبة ادخال مدة الخدمة';
  }
  return null;
}

String? elseplacevalidator(value) {
  if (value!.isEmpty) {
    return 'رجاء محبة ادخال المكان الاخر';
  }
  return null;
}
