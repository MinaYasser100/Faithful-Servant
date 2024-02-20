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
          "Get Start": 'هيا نبدا',
          "Login": 'تسجيل الدخول',
          'Register': 'انشاء حساب جديد',
          "successfully uploading image": 'نجحت عملية تحميل الصورة',
          'Loading...': '...تحميل',
          'Successfully Registration': 'نجحت عملية انشاء الحساب',
          'The registration is successful, now go to the login':
              'لقد نجحت عملية التسجيل يمكنك الان الذهاب الي صفحة تسجيل الدخول',
          'Go To Login': 'تسجيل الدخول',
          'Create Account': 'انشاء حساب جديد',
          'Name': 'الاسم',
          'Please enter your full name': 'ادخل اسمك رباعي',
          'Phone number 1': 'رقم المحمول الاول',
          'Please enter your phone number': 'ادخل رقم المحمول الاول',
          'Phone number 2': 'رقم المحمول الثاني',
          'Phone number should contain 11 digits':
              'رقم المحمول يجب ان يكون 11 رقم',
          'National ID': 'الرقم القومي',
          'Please enter your National ID': 'ادخل الرقم القومي الخاص بك',
          'National ID should contain 14 digits':
              'الرقم القومي يجب ان يكون 14 رقم',
          'You must enter a password !': 'يجب ان تنشئ كلمة مرور',
          'This password is weak !': 'كلمة المرور ضعيف',
          'Confirm Password': 'تاكيد كلمة المرور',
          'Please enter password again.': 'ادخل كلمة المرور مجددا',
          'Passwords do not match.': 'كلمة المرور غير صحيحة',
          'Number of home': 'رقم المنزل',
          'Please enter a number of home.': 'ادخل رقم المنزل',
          'Street name': 'اسم الشارع',
          "Please, enter your street name!": 'ادخل اسم الشارع',
          'Address of area': 'اسم منطقتك',
          "Please, enter your area of name!": 'ادخل اسم المنطقتك',
          'Educational qualification': 'المؤهل التعليمي',
          'Please, enter your educational qualification': 'ادخل مؤهلك التعليمي',
          'Father of confession': 'اب الاعتراف',
          'Please, enter your father of confession': 'ادخل اب اعترافك',
          "Forgotten Password": 'نسيت كلمة المرور',
          'The message is sended to this email to change password':
              'سوف يرسل لك رسالة علي هذا الايميل تستطيع من خلالها ان تغيير كلمة المرور',
          'Successfully': 'نجحت العملية',
          "Mail Adrress Here": 'الايميل هنا',
          'Enter your eamil address here to can change your password':
              'ادخل الايميل الخاص بيك هنا لتستطيع تغيير كلمة المرور',
          "Change Password": 'تغيير كلمة المرور',
          'General Supervisor': 'المشرف العام',
          "Statistics": 'إحصائيات',
          'KG sarvent Statistics : ': 'احصائيات خدام حضانة : ',
          'kg1': 'كيجي1',
          'kg2': 'كيجي2',
          'first': 'اولة',
          'second': 'ثانية',
          'third': 'ثالثة',
          'fourth': 'رابعة',
          'fifth': 'خامسة',
          'sixth': 'سادسة',
          'primary sarvent statistics : ': 'احصائيات خدام ابتدائي  : ',
          'sec girls': 'ث بنات',
          'sec boys': 'ث بنين',
          'pre girls': 'ع بنات',
          'pre boys': 'ع بنين',
          'proparatory and secondary statistics : ':
              'احصائيات اعدادي و ثانوي : ',
          'students': 'جامعيين',
          'graduates': 'خرجيين',
          'people': 'الشعب',
          'men': 'الرجال',
          'adults statistics : ': 'احصائيات الكبار : ',
          'Attendance & other': 'المتابعة',
          'Mothoer Dulaji': 'الام دولاجي',
          'Wisdoms': 'الحكيمات',
          'Stage': 'المسرح',
          'Demonstration Tools': 'وسائل الايضاح',
          'Brothers Of Lord': 'اخوة الرب',
          'Some services statistics : ': 'احصائيات بعض الخدمات : ',
          'Servants': 'اجتماع الخدام',
          'Sunday Servants': 'خدام الاحد',
          'Prepare Servants': 'اعداد خدام',
          'Servant statistics : ': 'احصائيات تخص الخدام',
          'Corals': 'الكورالات',
          'Festival': 'المهرجان',
          'Scouts': 'كشافة',
          'Counseling': 'المشورة',
          'Deacon': 'الشمامسة',
          'Some other services statistics : ': 'احصائيات بعض الخدمات الاخري : ',
          'statistics by gender : ': 'احصائيات حسب النوع : ',
          'male': 'ذكر',
          'female': 'انثي',
          'Print this information': 'طباعة هذة البيانات',
          'Print': 'طباعة',
          'Your Informations': 'معلوماتك',
          'Name : ': 'الاسم : ',
          'Email : ': 'الايميل : ',
          'phone : ': 'الهاتف : ',
          'Qualified : ': 'المؤهل : ',
          'National ID : ': 'الرقم القومي : ',
          'Address : ': 'العنوان : ',
          'Name of area : ': 'اسم المنطقة : ',
          'Church : ': 'كنيسة : ',
          'Service : ': 'الخدمة : ',
          'Modifie Informaion': 'تعديل البيانات',
          'Editing Informations': 'تعديل البيانات',
          'Father: ': 'اب الاعتراف : ',
          'birth date : ': 'تاريخ الميلاد : ',
          'Birth date': 'تاريخ الميلاد',
          'Please, enter your brith date': 'ادخل تاريك ميلادك',
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
          "Get Start": "Get Start",
          "Login": "Login",
          'Register': 'Register',
          "successfully uploading image": "successfully uploading image",
          'Loading...': 'Loading...',
          'Successfully Registration': 'Successfully Registration',
          'The registration is successful, now go to the login':
              'The registration is successful, now go to the login',
          'Go To Login': 'Go To Login',
          'Create Account': 'Create Account',
          'Name': 'Name',
          'Please enter your full name': 'Please enter your full name',
          'Phone number 1': 'Phone number 1',
          'Please enter your phone number': 'Please enter your phone number',
          'Phone number 2': 'Phone number 2',
          'Phone number should contain 11 digits':
              'Phone number should contain 11 digits',
          'National ID': 'National ID',
          'Please enter your National ID': 'Please enter your National ID',
          'National ID should contain 14 digits':
              'National ID should contain 14 digits',
          'You must enter a password !': 'You must enter a password !',
          'This password is weak !': 'This password is weak !',
          'Confirm Password': 'Confirm Password',
          'Please enter password again.': 'Please enter password again.',
          'Passwords do not match.': 'Passwords do not match.',
          'Number of home': 'Number of home',
          'Please enter a number of home.': 'Please enter a number of home.',
          'Street name': 'Street name',
          "Please, enter your street name!": "Please, enter your street name!",
          'Address of area': 'Address of area',
          "Please, enter your area of name!":
              "Please, enter your area of name!",
          'Educational qualification': 'Educational qualification',
          'Please, enter your educational qualification':
              'Please, enter your educational qualification',
          'Father of confession': 'Father of confession',
          'Please, enter your father of confession':
              'Please, enter your father of confession',
          "Forgotten Password": "Forgotten Password",
          'The message is sended to this email to change password':
              'The message is sended to this email to change password',
          'Successfully': 'Successfully',
          "Mail Adrress Here": "Mail Adrress Here",
          'Enter your eamil address here to can change your password':
              'Enter your eamil address here to can change your password',
          "Change Password": "Change Password",
          'General Supervisor': 'General Supervisor',
          "Statistics": "Statistics",
          'KG sarvent Statistics : ': 'KG sarvent Statistics : ',
          'kg1': 'kg1',
          'kg2': 'kg2',
          'first': 'first',
          'second': 'second',
          'third': 'third',
          'fourth': 'fourth',
          'fifth': 'fifth',
          'sixth': 'sixth',
          'primary sarvent statistics : ': 'primary sarvent statistics : ',
          'sec girls': 'sec girls',
          'sec boys': 'sec boys',
          'pre girls': 'pre girls',
          'pre boys': 'pre boys',
          'proparatory and secondary statistics : ':
              'proparatory and secondary statistics : ',
          'students': 'University',
          'graduates': 'graduates',
          'people': 'people',
          'men': 'men',
          'adults statistics : ': 'adults statistics : ',
          'Attendance & other': 'Follow Up',
          'Mothoer Dulaji': 'Mothoer Dulaji',
          'Wisdoms': 'Wisdoms',
          'Stage': 'Stage',
          'Demonstration Tools': 'Demonstration',
          'Brothers Of Lord': 'Brothers',
          'Some services statistics : ': 'Some services statistics : ',
          'Servants': 'Servants',
          'Sunday Servants': 'Sunday Servants',
          'Prepare Servants': 'Prepare Servants',
          'Servant statistics : ': 'Servant statistics : ',
          'Corals': 'Corals',
          'Festival Coordinators': 'Festival',
          'Scouts': 'Scouts',
          'Counseling': 'Counseling',
          'Deacon': 'Deacon',
          'Some other services statistics : ':
              'Some other services statistics : ',
          'statistics by gender : ': 'statistics by gender : ',
          'male': 'male',
          'female': 'female',
          'Print this information': 'Print this information',
          'Print': 'Print',
          'Your Informations': 'Your Informations',
          'Name : ': 'Name : ',
          'Email : ': 'Email : ',
          'phone : ': 'phone : ',
          'Qualified : ': 'Qualified : ',
          'National ID : ': 'National ID : ',
          'Address : ': 'Address : ',
          'Name of area : ': 'Name of area : ',
          'Church : ': 'Church : ',
          'Service : ': 'Service : ',
          'Modifie Informaion': 'Modifie Informaion',
          'Editing Informations': 'Editing Informations',
          'Father: ': 'Father: ',
          'birth date : ': 'birth date : ',
          'Birth date': 'Birth date',
          'Please, enter your brith date': 'Please, enter your brith date',
        },
      };
}
