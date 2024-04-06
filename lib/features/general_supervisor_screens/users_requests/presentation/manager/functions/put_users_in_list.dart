import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';

void putUsersInList(
    QuerySnapshot<Object?> querySnapshot, List<UserModel> users) {
  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
    UserModel user = UserModel.fromJson(userData);
    users.add(user);
  }
}
