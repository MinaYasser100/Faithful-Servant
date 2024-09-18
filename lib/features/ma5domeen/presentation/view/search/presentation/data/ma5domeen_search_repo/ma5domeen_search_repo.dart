import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Ma5domeenSearchRepo {
  Future<QuerySnapshot<Map<String, dynamic>>> getAllMa5domeenData(
      String stageName, String church);
}
