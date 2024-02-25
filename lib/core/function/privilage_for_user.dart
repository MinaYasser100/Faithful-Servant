String privilageForUser({required String role}) {
  if (role == 'خادم') {
    return 'خادم';
  } else if (role == 'المشرف العام') {
    return 'المشرف العام';
  } else if (role == 'امين اسرة' || role == 'امين اسرة مساعد') {
    return 'امين الخدمة';
  } else {
    return 'امين قطاع';
  }
}
