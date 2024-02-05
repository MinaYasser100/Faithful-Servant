import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRepo {
  Future<void> putUserInformationInFirebase({
    required UserModel userModel,
    required String userId,
    required String church,
  });
  Future<UserCredential> registerUser(
      {required String email, required String password});
}
