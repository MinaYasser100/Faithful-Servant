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
}
