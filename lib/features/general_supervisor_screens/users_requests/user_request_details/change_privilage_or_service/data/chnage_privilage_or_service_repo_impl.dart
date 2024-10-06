import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';

import 'change_privilage_or_service_repo.dart';

class ChnagePrivilageOrServiceRepoImpl implements ChangePrivilageOrServiceRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> updateInformationUser(
      {required UserModel userModelUpdate}) async {
    await firestore
        .collection(churchNamesBasedOnCode[userModelUpdate.church])
        .doc(userModelUpdate.church)
        .collection('users')
        .doc(userModelUpdate.userID)
        .update(
          userModelUpdate.toJson(),
        );
  }
}
