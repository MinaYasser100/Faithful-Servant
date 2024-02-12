import 'package:faithful_servant/core/function/validator/address_of_area_validator.dart';
import 'package:faithful_servant/core/function/validator/educational_qualification_validator.dart';
import 'package:faithful_servant/core/function/validator/email_validator.dart';
import 'package:faithful_servant/core/function/validator/father_of_conession_validator.dart';
import 'package:faithful_servant/core/function/validator/name_validator.dart';
import 'package:faithful_servant/core/function/validator/national_id_validator.dart';
import 'package:faithful_servant/core/function/validator/number_of_home_validator.dart';
import 'package:faithful_servant/core/function/validator/phone_validator.dart';
import 'package:faithful_servant/core/function/validator/street_name_validator.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/features/modifie_informations/presentation/manager/editing_informations_cubit.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:faithful_servant/core/widgets/profile_imge_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/custom_text_button.dart';

class ModifieInformationsViewBody extends StatefulWidget {
  const ModifieInformationsViewBody({super.key, required this.userModel});
  final UserModel userModel;
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
  String? imageUrl;
  GlobalKey<FormState> fromKey = GlobalKey();
  @override
  void initState() {
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
    imageUrl = widget.userModel.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<EditingInformationsCubit, EditingInformatinosStates>(
        builder: (context, state) {
          return Form(
            key: fromKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: ProfileImageWidget(
                      backgroundImage: NetworkImage(
                          BlocProvider.of<EditingInformationsCubit>(context)
                                  .imageSelected ??
                              imageUrl!),
                      onPressed: () {
                        BlocProvider.of<EditingInformationsCubit>(context)
                            .getProfileImage();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextFromField(
                    textEditingController: nameController,
                    labelText: 'Name'.tr,
                    keyboardType: TextInputType.name,
                    validator: nameValidator,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    textEditingController: emailController,
                    labelText: 'email'.tr,
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    textEditingController: phoneNum1Controller,
                    labelText: 'Phone number 1'.tr,
                    validator: phoneValidator,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    textEditingController: phoneNum2Controller,
                    labelText: 'Phone number 2'.tr,
                    validator: phoneValidator,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    textEditingController: nationalIDController,
                    labelText: 'National ID'.tr,
                    keyboardType: TextInputType.number,
                    validator: nationalIdValidator,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    textEditingController: numberOfHomeController,
                    labelText: 'Number of home'.tr,
                    validator: numberOfHomeValidator,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    textEditingController: streetNameController,
                    labelText: 'Street name'.tr,
                    validator: streetNameValidator,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    textEditingController: addressOfAreaController,
                    labelText: 'Address of area'.tr,
                    validator: addressOfAreaValidator,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    textEditingController: qualificationController,
                    labelText: 'Educational qualification'.tr,
                    validator: educationalQualificationValidator,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFromField(
                    textEditingController: fatherOfConfessionController,
                    labelText: 'Father of confession'.tr,
                    validator: fatherOfConessionValidator,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 50),
                  CustomTextButton(
                    textButton: 'Update'.tr,
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                      } else {}
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
}
