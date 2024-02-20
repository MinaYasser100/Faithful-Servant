import 'package:faithful_servant/features/register/data/model/user_model.dart';

abstract class EditingInformationsRepo {
  Future<void> updateInformationUser(
      {required UserModel userModel, required UserModel userModelUpdate});
}
