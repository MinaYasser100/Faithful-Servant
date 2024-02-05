import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/register_repo/register_reop.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepoImplemente implements RegisterRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> putUserInformationInFirebase(
      {required UserModel userModel,
      required String userId,
      required String church}) async {
    if (church == selectChurch[saintGeorge]) {
      await firestore
          .collection(saintGeorge)
          .doc(selectChurch[saintGeorge])
          .collection('users')
          .doc(userId)
          .set(userModel.toJson());
    }
    if (church == selectChurch[virginMary]) {
      await firestore
          .collection(virginMary)
          .doc(selectChurch[virginMary])
          .collection('users')
          .doc(userId)
          .set(userModel.toJson());
    }
    if (church == selectChurch[saintMark]) {
      await firestore
          .collection(saintMark)
          .doc(selectChurch[saintMark])
          .collection('users')
          .doc(userId)
          .set(userModel.toJson());
    }
    if (church == selectChurch[saintMain]) {
      await firestore
          .collection(saintMain)
          .doc(selectChurch[saintMain])
          .collection('users')
          .doc(userId)
          .set(userModel.toJson());
    }
    //await firestore.collection('users').doc(userId).set(userModel.toJson());
  }

  @override
  Future<UserCredential> registerUser(
      {required String email, required String password}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }
}
