import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/modifie_informations/data/editing_informations_repo/editing_informations_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';

class EditingInformationsRepoImplement implements EditingInformationsRepo {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> updateInformationUser(
      {required UserModel userModel,
      required UserModel userModelUpdate}) async {
    await firestore
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .doc(userModel.userID)
        .update(
          userModelUpdate.toJson(),
        );
  }
}
