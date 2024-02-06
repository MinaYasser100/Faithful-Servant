import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:hive/hive.dart';

Future<UserModel?> getUserData() async {
  var userBox = await Hive.openBox<UserModel>(kUserBox);
  UserModel? user = userBox.values.isNotEmpty ? userBox.values.first : null;
  await userBox.close();

  return user;
}
