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

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPrepareServantsStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'عداد خدام')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getServantStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'اجتماع الخدام')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getSundayServantsStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'مدارس احد يوم الاحد')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getBrothersOfLordStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'اخوة الرب')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getDemonstrationToolsStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'وسائل الايضاح')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getMothoerDulajiStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'الام دولاجي')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getStageStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'المسرح')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getWisdomsStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'الحكيمات')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getCoralsStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'الكورالات')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getCounselingCentreStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'مركز المشورة')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getDeaconsSchooltatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'مدرسة الشمامسة')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getFestivalCoordinatorsStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'منسقين المهرجان')
        .get();
    return value;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getScoutsStatistics(
      UserModel userModel) {
    Future<QuerySnapshot<Map<String, dynamic>>> value = FirebaseFirestore
        .instance
        .collection(churchNamesBasedOnCode[userModel.church])
        .doc(userModel.church)
        .collection('users')
        .where('currentService', isEqualTo: 'الكشافة')
        .get();
    return value;
  }
}
