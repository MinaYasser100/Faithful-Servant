import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';

abstract class GeneralSupervisorRepo {
  Future<QuerySnapshot<Map<String, dynamic>>> getKG1Statistics(
      UserModel userModel);
  Future<QuerySnapshot<Map<String, dynamic>>> getKG2Statistics(
      UserModel userModel);
}
