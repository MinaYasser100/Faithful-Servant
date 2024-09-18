import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/search/presentation/data/ma5domeen_search_repo/ma5domeen_search_repo.dart';

class Ma5domeenSearchRepoImplement implements Ma5domeenSearchRepo {
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getAllMa5domeenData(
      String stageName) async {
    return await FirebaseFirestore.instance
        .collection("ma5domeen")
        .doc(church)
        .collection(stageName)
        .get();
  }
}
