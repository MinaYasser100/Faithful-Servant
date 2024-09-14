import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';

abstract class UserRequestRepo {
  CollectionReference<Object?> fetchUsersFromFirebase(
      {required UserModel userModel});

  Future<void> updateInformationUser(
      {required UserModel userModel, required UserModel userModelUpdate});
}
