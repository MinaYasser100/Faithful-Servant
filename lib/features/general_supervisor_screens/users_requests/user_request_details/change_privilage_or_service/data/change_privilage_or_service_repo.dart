import 'package:faithful_servant/features/register/data/model/user_model.dart';

abstract class ChangePrivilageOrServiceRepo {
  Future<void> updateInformationUser({required UserModel userModelUpdate});
}
