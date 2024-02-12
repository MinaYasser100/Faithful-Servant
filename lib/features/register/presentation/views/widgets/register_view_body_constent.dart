import 'package:faithful_servant/core/function/screen_action/custom_sanck_bar.dart';
import 'package:faithful_servant/core/function/validator/educational_qualification_validator.dart';
import 'package:faithful_servant/core/function/validator/address_of_area_validator.dart';
import 'package:faithful_servant/core/function/validator/confirm_password_validator.dart';
import 'package:faithful_servant/core/function/validator/email_validator.dart';
import 'package:faithful_servant/core/function/validator/father_of_conession_validator.dart';
import 'package:faithful_servant/core/function/validator/name_validator.dart';
import 'package:faithful_servant/core/function/validator/national_id_validator.dart';
import 'package:faithful_servant/core/function/validator/number_of_home_validator.dart';
import 'package:faithful_servant/core/function/validator/password_validator.dart';
import 'package:faithful_servant/core/function/validator/phone_validator.dart';
import 'package:faithful_servant/core/function/validator/street_name_validator.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/core/widgets/navigation_back_button.dart';
import 'package:faithful_servant/features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:faithful_servant/features/register/presentation/views/function/determind_church.dart';
import 'package:faithful_servant/features/register/presentation/views/function/register_failure_show_dialog.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/choose_form_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../../../core/function/screen_action/successfully_show_dialog.dart';
import '../../../../../core/widgets/profile_imge_widget.dart';

class ReisterViewBodyContent extends StatefulWidget {
  const ReisterViewBodyContent({
    super.key,
    required this.fromKey,
    required this.nameController,
    required this.emailController,
    required this.phoneNum1Controller,
    required this.nationalIDController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.qualificationController,
    required this.numberOfHomeController,
    required this.fatherOfConfessionController,
    required this.streetNameController,
    required this.addressOfAreaController,
    required this.phoneNum2Controller,
  });

  final GlobalKey<FormState> fromKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneNum1Controller;
  final TextEditingController phoneNum2Controller;
  final TextEditingController nationalIDController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController qualificationController;
  final TextEditingController numberOfHomeController;
  final TextEditingController streetNameController;
  final TextEditingController addressOfAreaController;
  final TextEditingController fatherOfConfessionController;

  @override
  State<ReisterViewBodyContent> createState() => _ReisterViewBodyContentState();
}

class _ReisterViewBodyContentState extends State<ReisterViewBodyContent> {
  final List<String> items = ['خادم', 'امين الخدمة', 'المشرف العام'];
  String selectedItem = 'خادم';
  final List<String> churchItems = [
    saintGeorge,
    virginMary,
    saintMark,
    saintMain
  ];
  String churchSelectedItem = saintGeorge;
  final List<String> genderItems = ['ذكر', 'انثي'];
  String selectGenderItem = 'ذكر';
  String selectCurrentService = 'حضانة كيجي 1';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterCubitImageUploadingLoading ||
              state is RegisterCubitUserRgistrationLoading) {
            EasyLoading.show(
              status: 'Loading...'.tr,
            );
          }
          if (state is RegisterCubitImageUploadingSuccess) {
            EasyLoading.dismiss();
            customSnackBar(context, "successfully uploading image".tr);
          }
          if (state is RegisterCubitPutUserInformationInFirebaseSuccess) {
            EasyLoading.dismiss();
            successfullyShowDialog(
              context: context,
              titleText: 'Successfully Registration'.tr,
              contentText:
                  'The registration is successful, now go to the login'.tr,
              buttonText: 'Go To Login'.tr,
            );
            widget.nameController.clear();
            widget.emailController.clear();
            widget.phoneNum1Controller.clear();
            widget.phoneNum2Controller.clear();
            widget.nationalIDController.clear();
            widget.passwordController.clear();
            widget.confirmPasswordController.clear();
            widget.qualificationController.clear();
            widget.numberOfHomeController.clear();
            widget.streetNameController.clear();
            widget.addressOfAreaController.clear();
            widget.fatherOfConfessionController.clear();
            BlocProvider.of<RegisterCubit>(context).imageSelected == null;
          }
          if (state is RegisterCubitUserRgistrationFailure ||
              state is RegisterCubitPutUserInformationInFirebaseFailure) {
            EasyLoading.dismiss();
            registerFailureShowDialog(context);
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NavigationBackButton(),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Create Account'.tr,
                  style: Styles.textStyle30,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: ProfileImageWidget(
                  backgroundImage: NetworkImage(BlocProvider.of<RegisterCubit>(
                              context)
                          .imageSelected ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzb62jTDtJjG9KgljxtM0vPyWOq_16WOkIgA&usqp=CAU'),
                  onPressed: () {
                    BlocProvider.of<RegisterCubit>(context).getProfileImage();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: widget.fromKey,
                  autovalidateMode:
                      BlocProvider.of<RegisterCubit>(context).autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      CustomTextFromField(
                        textEditingController: widget.nameController,
                        labelText: 'Name'.tr,
                        keyboardType: TextInputType.name,
                        validator: nameValidator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.emailController,
                        labelText: 'email'.tr,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.phoneNum1Controller,
                        labelText: 'Phone number 1'.tr,
                        validator: phoneValidator,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.phoneNum2Controller,
                        labelText: 'Phone number 2'.tr,
                        validator: phoneValidator,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.nationalIDController,
                        labelText: 'National ID'.tr,
                        keyboardType: TextInputType.number,
                        validator: nationalIdValidator,
                      ),
                      const SizedBox(height: 15),
                      ChooseFromItems(
                        items: items,
                        selectedItem: selectedItem,
                        onChanged: (newValue) {
                          setState(() {
                            selectedItem = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      ChooseFromItems(
                        items: churchItems,
                        selectedItem: churchSelectedItem,
                        onChanged: (newValue) {
                          setState(() {
                            churchSelectedItem = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      ChooseFromItems(
                        items: genderItems,
                        selectedItem: selectGenderItem,
                        onChanged: (newValue) {
                          setState(() {
                            selectGenderItem = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      ChooseFromItems(
                        items: currentServiceItems,
                        selectedItem: selectCurrentService,
                        onChanged: (newValue) {
                          setState(() {
                            selectCurrentService = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.passwordController,
                        labelText: 'password'.tr,
                        iconData:
                            BlocProvider.of<RegisterCubit>(context).suffixIcon,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: BlocProvider.of<RegisterCubit>(context)
                            .obscurePassword,
                        suffixOnPressed: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .changeShowPassword();
                        },
                        validator: passwordVaildator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.confirmPasswordController,
                        labelText: 'Confirm Password'.tr,
                        iconData: BlocProvider.of<RegisterCubit>(context)
                            .confirmSuffixIcon,
                        suffixOnPressed: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .changeShowConfirmPassword();
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: BlocProvider.of<RegisterCubit>(context)
                            .obscureConfirmPassword,
                        validator: (value) => confirmPasswordValidator(
                            value, widget.passwordController.text),
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.numberOfHomeController,
                        labelText: 'Number of home'.tr,
                        validator: numberOfHomeValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.streetNameController,
                        labelText: 'Street name'.tr,
                        validator: streetNameValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.addressOfAreaController,
                        labelText: 'Address of area'.tr,
                        validator: addressOfAreaValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.qualificationController,
                        labelText: 'Educational qualification'.tr,
                        validator: educationalQualificationValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController:
                            widget.fatherOfConfessionController,
                        labelText: 'Father of confession'.tr,
                        validator: fatherOfConessionValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 50),
                      CustomTextButton(
                        textButton: 'Create Account'.tr,
                        onPressed: () {
                          if (widget.fromKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context)
                                .userRegistration(
                              name: widget.nameController.text,
                              email: widget.emailController.text,
                              password: widget.passwordController.text,
                              phoneNum1: widget.phoneNum1Controller.text,
                              phoneNum2: widget.phoneNum2Controller.text,
                              image: BlocProvider.of<RegisterCubit>(context)
                                      .imageSelected ??
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzb62jTDtJjG9KgljxtM0vPyWOq_16WOkIgA&usqp=CAU',
                              nationalId: widget.nationalIDController.text,
                              privilage: selectedItem,
                              church: determindChurch(
                                churchSelectedItem: churchSelectedItem,
                              ),
                              gender: selectGenderItem,
                              numberOfnumber:
                                  widget.numberOfHomeController.text,
                              qualification:
                                  widget.qualificationController.text,
                              streetName: widget.streetNameController.text,
                              addressOfArea:
                                  widget.addressOfAreaController.text,
                              currentService: selectCurrentService,
                              fatherOfConfession:
                                  widget.fatherOfConfessionController.text,
                            );
                          } else {
                            BlocProvider.of<RegisterCubit>(context)
                                .changeAutovalidateMode();
                          }
                        },
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
