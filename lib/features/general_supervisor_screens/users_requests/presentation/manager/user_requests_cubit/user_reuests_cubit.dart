import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/data/user_request_repo/user_requset_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../functions/put_users_in_list.dart';

part 'user_reuests_state.dart';

class UserRequestsCubit extends Cubit<UserRequestsState> {
  UserRequestsCubit(this._userRequestRepo) : super(UserReuestsInitial());
  final UserRequestRepo _userRequestRepo;

  List<UserModel> usersRequsets = [];

  Future<List<UserModel>> fetchUsersFromFirebase() async {
    emit(UserRequestsFetchUsersFromFirebaseLoading());
    UserModel? userModel = await getUserData();
    List<UserModel> users = [];

    try {
      CollectionReference usersCollection =
          _userRequestRepo.fetchUsersFromFirebase(userModel: userModel!);

      QuerySnapshot querySnapshot = await usersCollection.get();

      putUsersInList(querySnapshot, users);
      emit(UserRequestsFetchUsersFromFirebaseSuccess());
    } catch (e) {
      emit(UserRequestsFetchUsersFromFirebaseFailure());
    }
    return users;
  }

  Future<void> getUserRequestsFromFirebase() async {
    emit(UserRequestsGetUsersRequestsFromFirebaseLoading());
    try {
      List<UserModel> users = await fetchUsersFromFirebase();
      checkOnIsNotActiveUser(users);
      emit(UserRequestsGetUsersRequestsFromFirebaseSuccess());
    } catch (e) {
      emit(UserRequestsGetUsersRequestsFromFirebaseFailure());
    }
  }

  void checkOnIsNotActiveUser(List<UserModel> users) {
    for (UserModel element in users) {
      if (element.isActive == false) {
        usersRequsets.add(element);
      }
    }
  }

  Future<void> activeUser({required UserModel userModel}) async {
    emit(UserRequestsActiveUserLoading());
    try {
      UserModel userModelUpdate = UserModel(
        userID: userModel.userID,
        name: userModel.name,
        email: userModel.email,
        phoneNum1: userModel.phoneNum1,
        phoneNum2: userModel.phoneNum2,
        image: userModel.image,
        nationalId: userModel.nationalId,
        privilage: userModel.privilage,
        church: userModel.church,
        gender: userModel.gender,
        numberOfnumber: userModel.numberOfnumber,
        streetName: userModel.streetName,
        addressOfArea: userModel.addressOfArea,
        qualification: userModel.qualification,
        currentService: userModel.currentService,
        fatherOfConfession: userModel.fatherOfConfession,
        brithDate: userModel.brithDate,
        role: userModel.role,
        isActive: true,
      );
      _userRequestRepo
          .updateInformationUser(
              userModel: userModel, userModelUpdate: userModelUpdate)
          .then((value) {
        emit(UserRequestsActiveUserSuccess());
      });
    } catch (e) {
      emit(UserRequestsActiveUserFailure());
    }
  }
}
