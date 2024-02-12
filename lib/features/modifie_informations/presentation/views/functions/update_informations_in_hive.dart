import 'package:faithful_servant/core/function/save_user_data.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:hive/hive.dart';

Future<void> updateInformationsInHive(UserModel userModelUpdate) async {
  var box = await Hive.openBox<UserModel>(kUserBox);
  await box.clear();
  saveUserData(
    UserModel.fromJson(
      userModelUpdate.toJson(),
    ),
  );
}
