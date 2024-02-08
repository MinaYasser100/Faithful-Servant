import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/general_supervisor_screens/supervisor_statistic/data/general_supervisor_repo/general_supervisor_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';

class GeneralSupervisorRepoImpelment implements GeneralSupervisorRepo {
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getKG1Statistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'حضانة كيجي 1')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getKG2Statistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'حضانة كيجي 2')
        .get();
    return value;
  }
}
