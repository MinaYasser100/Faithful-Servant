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

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary1Statistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'اولي ابتدائي')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary2Statistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'ثانية ابتدائي')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary3Statistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'ثالثة ابتدائي')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary4Statistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'رابعة ابتدائي')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary5Statistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'خامسة ابتدائي')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary6Statistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'سادسة ابتدائي')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPerparatoryBoysStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'اعدادي بنين')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPerparatoryGirlsStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'اعدادي بنات')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getSecondaryBoysStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'ثانوي بنين')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getSecondaryGirlsStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'ثانوي بنات')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getGraduatesStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'خريجين')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getMenStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'اجتماع الرجال')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPeopleStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'الشعب')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getStudentsStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'جامعيين')
        .get();
    return value;
  }
}
