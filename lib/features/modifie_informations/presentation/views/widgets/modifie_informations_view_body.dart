import 'package:faithful_servant/features/modifie_informations/presentation/manager/editing_informations_cubit.dart';
import 'package:faithful_servant/features/modifie_informations/presentation/views/widgets/image_profile_for_modifie_user.dart';
import 'package:faithful_servant/features/modifie_informations/presentation/views/widgets/modifie_informations_controller_date.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/custom_text_button.dart';

class ModifieInformationsViewBody extends StatefulWidget {
  const ModifieInformationsViewBody(
      {super.key, required this.userModel, required this.perosnal});
  final UserModel userModel;
  final bool perosnal;
  @override
  State<ModifieInformationsViewBody> createState() =>
      _ModifieInformationsViewBodyState();
}

class _ModifieInformationsViewBodyState
    extends State<ModifieInformationsViewBody> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNum1Controller = TextEditingController();
  TextEditingController phoneNum2Controller = TextEditingController();
  TextEditingController nationalIDController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController numberOfHomeController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController addressOfAreaController = TextEditingController();
  TextEditingController fatherOfConfessionController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  String? imageUrl;
  GlobalKey<FormState> fromKey = GlobalKey();
  @override
  void initState() {
    initialTakeValueInController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocConsumer<EditingInformationsCubit, EditingInformatinosStates>(
        listener: (context, state) {
          if (state is EditingInformatinosUpdateInforamtionsUserLoading ||
              state is EditingInformatinosImageUploadingLoading) {
            EasyLoading.show(
              status: 'Loading',
            );
          }
          if (state is EditingInformatinosUpdateInforamtionsUserSuccess ||
              state is EditingInformatinosImageUploadingSuccess) {
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {
          return Form(
            key: fromKey,
            autovalidateMode: BlocProvider.of<EditingInformationsCubit>(context)
                .autovalidateMode,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageProfileForModifieUser(imageUrl: imageUrl),
                  const SizedBox(height: 20),
                  ModifieInformationsControllerDate(
                    nameController: nameController,
                    emailController: emailController,
                    phoneNum1Controller: phoneNum1Controller,
                    phoneNum2Controller: phoneNum2Controller,
                    birthDateController: birthDateController,
                    nationalIDController: nationalIDController,
                    numberOfHomeController: numberOfHomeController,
                    streetNameController: streetNameController,
                    addressOfAreaController: addressOfAreaController,
                    qualificationController: qualificationController,
                    fatherOfConfessionController: fatherOfConfessionController,
                  ),
                  const SizedBox(height: 50),
                  CustomTextButton(
                    textButton: 'Update'.tr,
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        BlocProvider.of<EditingInformationsCubit>(context)
                            .updateInformationUser(
                          image:
                              BlocProvider.of<EditingInformationsCubit>(context)
                                      .imageSelected ??
                                  imageUrl!,
                          name: nameController.text,
                          email: emailController.text,
                          phoneNum1: phoneNum1Controller.text,
                          phoneNum2: phoneNum2Controller.text,
                          nationalId: nationalIDController.text,
                          homeOfNumber: numberOfHomeController.text,
                          streetName: streetNameController.text,
                          nameArea: addressOfAreaController.text,
                          qualification: qualificationController.text,
                          father: fatherOfConfessionController.text,
                          birthDate: birthDateController.text,
                          userModel: widget.userModel,
                          personal: widget.perosnal,
                          context: context,
                        );
                      } else {
                        BlocProvider.of<EditingInformationsCubit>(context)
                            .changeAutovalidateMode();
                      }
                    },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void initialTakeValueInController() {
    nameController.text = widget.userModel.name;
    emailController.text = widget.userModel.email;
    phoneNum1Controller.text = widget.userModel.phoneNum1;
    phoneNum2Controller.text = widget.userModel.phoneNum2;
    nationalIDController.text = widget.userModel.nationalId;
    qualificationController.text = widget.userModel.qualification;
    numberOfHomeController.text = widget.userModel.numberOfnumber;
    streetNameController.text = widget.userModel.streetName;
    addressOfAreaController.text = widget.userModel.addressOfArea;
    fatherOfConfessionController.text = widget.userModel.fatherOfConfession;
    birthDateController.text = widget.userModel.brithDate;
    imageUrl = widget.userModel.image;
  }
}
