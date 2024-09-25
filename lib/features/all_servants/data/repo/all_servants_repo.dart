import 'package:faithful_servant/features/register/data/model/user_model.dart';

abstract class AllServantsRepo {
  Future<List<UserModel>> getAllServantsFromFirebase();
}
