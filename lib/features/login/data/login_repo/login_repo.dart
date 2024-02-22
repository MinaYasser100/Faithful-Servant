import 'package:faithful_servant/features/register/data/model/user_model.dart';

abstract class LoginRepo {
  Future<void> deleteUserEmail();
  Future<void> deleteUserInformationFromFirebase(
      {required UserModel userModel});
}
