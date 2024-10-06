import 'package:equatable/equatable.dart';
import 'package:faithful_servant/core/function/privilage_for_user.dart';
import 'package:faithful_servant/core/function/show_dialog/successfully_show_dialog.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/user_request_details/change_privilage_or_service/data/change_privilage_or_service_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

part 'change_privilage_or_service_state.dart';

class ChangePrivilageOrServiceCubit
    extends Cubit<ChangePrivilageOrServiceState> {
  ChangePrivilageOrServiceCubit(this.changePrivilageOrServiceRepo)
      : super(ChangePrivilageOrServiceInitial());
  final ChangePrivilageOrServiceRepo changePrivilageOrServiceRepo;

  void changeServantPrivilageOrService(
      {required UserModel userModel,
      required BuildContext buildContext}) async {
    emit(ChangePrivilageOrServiceSuccess());
    EasyLoading.show(
      status: 'Loading...'.tr,
    );
    try {
      UserModel userModelUpdate = UserModel(
        userID: userModel.userID,
        name: userModel.name,
        email: userModel.email,
        phoneNum1: userModel.phoneNum1,
        phoneNum2: userModel.phoneNum2,
        image: userModel.image,
        nationalId: userModel.nationalId,
        qualification: userModel.qualification,
        church: userModel.church,
        gender: userModel.gender,
        numberOfnumber: userModel.numberOfnumber,
        streetName: userModel.streetName,
        addressOfArea: userModel.addressOfArea,
        privilage: privilageForUser(role: userModel.role),
        currentService: userModel.currentService,
        fatherOfConfession: userModel.fatherOfConfession,
        brithDate: userModel.brithDate,
        role: userModel.role,
        isActive: userModel.isActive,
      );
      await changePrivilageOrServiceRepo.updateInformationUser(
        userModelUpdate: userModelUpdate,
      );
      EasyLoading.dismiss();
      emit(ChangePrivilageOrServiceSuccess());
      successfullyShowDialog(
          context: buildContext,
          titleText: 'تحديث البيانات',
          contentText: 'تم تحديث البيانات بنجاح',
          buttonText: 'OK',
          onPressed: () {
            Get.back();
            Get.back();
          });
    } catch (e) {
      emit(ChangePrivilageOrServiceFailure(errorMessage: e.toString()));
    }
  }
}
