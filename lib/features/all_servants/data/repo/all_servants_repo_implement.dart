import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/all_servants/data/repo/all_servants_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';

class AllServantsRepoImplement implements AllServantsRepo {
  @override
  Future<List<UserModel>> getAllServantsFromFirebase() async {
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection(saintGeorge)
        .doc(selectChurch[saintGeorge])
        .collection('users')
        .get();
    List<UserModel> users = value.docs
        .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
    return users;
  }
}
