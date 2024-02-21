import 'dart:io';
import 'package:faithful_servant/core/function/screen_action/successfully_show_dialog.dart';
import 'package:faithful_servant/features/modifie_informations/data/editing_informations_repo/editing_informations_repo.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../views/functions/update_informations_in_hive.dart';

part 'editing_informations_states.dart';

class EditingInformationsCubit extends Cubit<EditingInformatinosStates> {
  EditingInformationsCubit(this.editingInformationsRepo)
      : super(EditingInformationsInitial());
  final EditingInformationsRepo editingInformationsRepo;
  String? imageSelected;
  File? profileImage;
  var picker = ImagePicker();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void changeAutovalidateMode() {
    autovalidateMode = AutovalidateMode.always;
    emit(EditingInformationsChangeAutovalidateMode());
  }

  Future<void> getProfileImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      uploadImage(profileImage);
      emit(EditingInformatinosPickProfileImageSuccess());
    } else {
      emit(EditingInformatinosPickProfileImageFailure());
    }
  }

  final FirebaseStorage _storage = FirebaseStorage.instance;
  Future<void> uploadImage(File? image) async {
    if (image == null) {
      // No image selected
      return;
    }
    emit(EditingInformatinosImageUploadingLoading());

    try {
      Reference storageReference = _storage
          .ref()
          .child('profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      UploadTask uploadTask = storageReference.putFile(image);

      await uploadTask.whenComplete(() {
        print('Image uploaded successfully!');
      });

      String downloadURL = await storageReference.getDownloadURL();
      imageSelected = downloadURL;
      emit(EditingInformatinosImageUploadingSuccess());
    } catch (error) {
      emit(EditingInformatinosImageUploadingFailure());
    }
  }

  Future<void> updateInformationUser({
    required String image,
    required String name,
    required String email,
    required String phoneNum1,
    required String phoneNum2,
    required String nationalId,
    required String homeOfNumber,
    required String streetName,
    required String nameArea,
    required String qualification,
    required String father,
    required String birthDate,
    required UserModel userModel,
    required bool personal,
    required BuildContext context,
  }) async {
    emit(EditingInformatinosUpdateInforamtionsUserLoading());
    //UserModel? userModel = await getUserData();
    try {
      UserModel userModelUpdate = UserModel(
        userID: userModel.userID,
        name: name,
        email: email,
        phoneNum1: phoneNum1,
        phoneNum2: phoneNum2,
        image: image,
        nationalId: nationalId,
        privilage: userModel.privilage,
        church: userModel.church,
        gender: userModel.gender,
        numberOfnumber: homeOfNumber,
        streetName: streetName,
        addressOfArea: nameArea,
        qualification: qualification,
        currentService: userModel.currentService,
        fatherOfConfession: father,
        brithDate: birthDate,
      );
      editingInformationsRepo
          .updateInformationUser(
              userModel: userModel, userModelUpdate: userModelUpdate)
          .then((value) async {
        if (personal) {
          await updateInformationsInHive(userModelUpdate);
        }
        emit(EditingInformatinosUpdateInforamtionsUserSuccess());
        successfullyShowDialog(
            context: context,
            titleText: 'تحديث البيانات',
            contentText: 'تم تحديث البيانات بنجاح',
            buttonText: 'OK',
            onPressed: () {
              Get.back();
            });
      });
    } catch (e) {
      emit(EditingInformatinosUpdateInforamtionsUserFailure());
    }
  }
}
