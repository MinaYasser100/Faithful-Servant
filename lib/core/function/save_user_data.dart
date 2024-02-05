import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:hive/hive.dart';

void saveUserData(DocumentSnapshot<Map<String, dynamic>> value) {
  var box = Hive.box(kUserBox);
  box.add(value);
}
