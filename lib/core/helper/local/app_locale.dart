import 'package:get/get.dart';

class Applocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          'email': 'الايميل',
          'password': 'كلمة المرور',
          'Enter your email and password':
              'من فضلك ادخل الايميل و كلمة المرور الخاصين بك',
          'welcome back': 'مرحبا بعودتك',
          'login': 'تسجيل الدخول',
          'forgotten password': 'نسيت كلمة المرور',
          'Please, enter your password': 'من فضلك ادخل كلمة المرور الخاصه بك',
          'Please, enter your email !': 'من فضلك ادخل الايميل الخاص بك',
          'Create New Acount': 'انشاء حساب جديد',
          'Arabic': 'اللغة العربية',
          'English': 'اللغة الانجليزية',
          'Change Language': 'تغيير اللغة',
        },
        "en": {
          'email': 'Email',
          'password': 'Password',
          'Enter your email and password': 'Enter your email and password',
          'welcome back': 'Welcome Back',
          'login': 'LOGIN',
          'forgotten password': 'Forgotten Password',
          'Please, enter your password': 'Please, enter your password',
          'Please, enter your email !': 'Please, enter your email !',
          'Create New Acount': 'Create New Acount',
          'Arabic': 'Arabic',
          'English': 'English',
          'Change Language': 'Change Language',
        },
      };
}
