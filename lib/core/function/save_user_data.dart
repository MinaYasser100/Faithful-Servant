import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:hive/hive.dart';

void saveUserData(UserModel userModel) {
  var box = Hive.box<UserModel>(kUserBox);
  box.add(userModel);
}
