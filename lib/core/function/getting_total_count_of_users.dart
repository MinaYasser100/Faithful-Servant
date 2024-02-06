import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';

Future<int> gettingTotalcountOfUsers({required UserModel user}) async {
  late int count;
  await FirebaseFirestore.instance
      .collection(churchNamesBasedOnCode[user.church])
      .doc(user.church)
      .collection('users')
      .where(user.currentService)
      .get()
      .then((value) {
    count = value.docs.length;
  });
  return count;
}

Future<int> gettingcountOfUsersBasedOnFilter(
    {required String filterKey,
    required String filtetrValue,
    required UserModel user}) async {
  late int count;
  await FirebaseFirestore.instance
      .collection(churchNamesBasedOnCode[user.church])
      .doc(user.church)
      .collection('users')
      .where(user.currentService)
      .where(filterKey, isEqualTo: filtetrValue)
      .get()
      .then((value) {
    count = value.docs.length;
  });
  return count;
}
