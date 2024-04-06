import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/data/user_request_repo/user_requset_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../functions/put_users_in_list.dart';

part 'user_reuests_state.dart';

class UserRequestsCubit extends Cubit<UserReuestsState> {
  UserRequestsCubit(this.userRequestRepo) : super(UserReuestsInitial());
  final UserRequestRepo userRequestRepo;

  List<UserModel> usersRequsets = [];

  Future<List<UserModel>> fetchUsersFromFirebase() async {
    emit(UserReuestsFetchUsersFromFirebaseLoading());
    UserModel? userModel = await getUserData();
    List<UserModel> users = [];

    try {
      CollectionReference usersCollection =
          userRequestRepo.fetchUsersFromFirebase(userModel: userModel!);

      QuerySnapshot querySnapshot = await usersCollection.get();

      putUsersInList(querySnapshot, users);
      emit(UserReuestsFetchUsersFromFirebaseSuccess());
    } catch (e) {
      emit(UserReuestsFetchUsersFromFirebaseFailure());
    }
    return users;
  }

  Future<void> getUserRequestsFromFirebase() async {
    emit(UserReuestsGetUsersRequestsFromFirebaseLoading());
    try {
      List<UserModel> users = await fetchUsersFromFirebase();
      checkOnIsNotActiveUser(users);
      emit(UserReuestsGetUsersRequestsFromFirebaseSuccess());
    } catch (e) {
      emit(UserReuestsGetUsersRequestsFromFirebaseFailure());
    }
  }

  void checkOnIsNotActiveUser(List<UserModel> users) {
    for (UserModel element in users) {
      if (element.isActive == false) {
        usersRequsets.add(element);
      }
    }
  }
}
