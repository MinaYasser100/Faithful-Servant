import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';

List<Map<dynamic, dynamic>> determinedPagesOptions(
    {required UserModel userModel}) {
  if (userModel.privilage == 'المشرف العام') {
    return genetalSuperVisorPages;
  } else if (userModel.privilage == 'امين الخدمة') {
    return generalServantPage;
  } else {
    return servantPages;
  }
}
