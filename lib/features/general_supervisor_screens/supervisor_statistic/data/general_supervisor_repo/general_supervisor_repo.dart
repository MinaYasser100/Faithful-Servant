import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';

abstract class GeneralSupervisorRepo {
  Future<QuerySnapshot<Map<String, dynamic>>> getKG1Statistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getKG2Statistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary1Statistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary2Statistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary3Statistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary4Statistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary5Statistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getPrimary6Statistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getPerparatoryGirlsStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getPerparatoryBoysStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getSecondaryGirlsStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getSecondaryBoysStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getStudentsStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getGraduatesStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getPeopleStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getMenStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getServantStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getSundayServantsStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getPrepareServantsStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getMothoerDulajiStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getWisdomsStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getStageStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getDemonstrationToolsStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getBrothersOfLordStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getCoralsStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getFestivalCoordinatorsStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getScoutsStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getCounselingCentreStatistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getDeaconsSchooltatistics(
      UserModel userModel);
}
