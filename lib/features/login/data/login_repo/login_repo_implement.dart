import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/login/data/login_repo/login_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepoImplement implements LoginRepo {
  @override
  Future<void> deleteUserEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.delete();
    }
  }

  @override
  Future<void> deleteUserInformationFromFirebase(
      {required UserModel userModel}) async {
    await FirebaseFirestore.instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .doc(userModel.userID)
        .delete();
  }
}
