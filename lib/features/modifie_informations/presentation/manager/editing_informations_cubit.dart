import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'editing_informations_states.dart';

class EditingInformationsCubit extends Cubit<EditingInformatinosStates> {
  EditingInformationsCubit() : super(EditingInformationsInitial());

  String? imageSelected;
  File? profileImage;
  var picker = ImagePicker();
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
}
