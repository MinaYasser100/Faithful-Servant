import 'package:bloc/bloc.dart';
import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:meta/meta.dart';

part 'personal_state.dart';

class PersonalCubit extends Cubit<PersonalState> {
  PersonalCubit({this.name, this.personalImageUrl})
      : super(PersonalPersonaldatafetchloading());
  String? name = 'الاسم';
  String? personalImageUrl = '';
  void init() async {
    emit(PersonalPersonaldatafetchloading());
    UserModel? userModel = await getUserData();
    if (userModel != null) {
      name = userModel.name;
      personalImageUrl = userModel.image;
      emit(PersonalPersonaldatafetchsuccess());
    } else {
      //error on getting data form hive
      emit(PersonalPersonaldatafetchfailed());
    }
  }
}
