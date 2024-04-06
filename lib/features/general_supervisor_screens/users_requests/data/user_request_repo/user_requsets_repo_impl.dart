import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/data/user_request_repo/user_requset_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';

class UserRequestsRepoImplement implements UserRequestRepo {
  @override
  CollectionReference<Object?> fetchUsersFromFirebase(
      {required UserModel userModel}) {
    return FirebaseFirestore.instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users');
  }
}
