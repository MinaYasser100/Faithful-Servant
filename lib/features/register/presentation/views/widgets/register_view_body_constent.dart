import 'package:faithful_servant/core/function/address_of_area_validator.dart';
import 'package:faithful_servant/core/function/confirm_password_validator.dart';
import 'package:faithful_servant/core/function/current_service_validator.dart';
import 'package:faithful_servant/core/function/custom_sanck_bar.dart';
import 'package:faithful_servant/core/function/educational_qualification_validator.dart';
import 'package:faithful_servant/core/function/email_validator.dart';
import 'package:faithful_servant/core/function/father_of_conession_validator.dart';
import 'package:faithful_servant/core/function/name_validator.dart';
import 'package:faithful_servant/core/function/national_id_validator.dart';
import 'package:faithful_servant/core/function/number_of_home_validator.dart';
import 'package:faithful_servant/core/function/password_validator.dart';
import 'package:faithful_servant/core/function/phone_validator.dart';
import 'package:faithful_servant/core/function/street_name_validator.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/core/widgets/navigation_back_button.dart';
import 'package:faithful_servant/features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:faithful_servant/features/register/presentation/views/function/determind_church.dart';
import 'package:faithful_servant/features/register/presentation/views/function/register_failure_show_dialog.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/choose_your_church.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../function/register_successfully_show_dialog.dart';
import 'choose_privilage.dart';
import 'profile_imge_widget.dart';

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
    required this.currentServiceController,
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
  final TextEditingController currentServiceController;

  @override
  State<ReisterViewBodyContent> createState() => _ReisterViewBodyContentState();
}

class _ReisterViewBodyContentState extends State<ReisterViewBodyContent> {
  final List<String> items = ['المشرف العام', 'امين الخدمة', 'خادم'];
  String selectedItem = 'المشرف العام';
  final List<String> churchItems = [
    saintGeorge,
    virginMary,
    saintMark,
    saintMain
  ];
  String churchSelectedItem = saintGeorge;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterCubitImageUploadingLoading ||
              state is RegisterCubitUserRgistrationLoading) {
            EasyLoading.show(
              status: 'Loading...',
            );
          }
          if (state is RegisterCubitImageUploadingSuccess) {
            EasyLoading.dismiss();
            customSnackBar(context, "successfully uploading image");
          }
          if (state is RegisterCubitPutUserInformationInFirebaseSuccess) {
            EasyLoading.dismiss();
            registerSuccessfullyShowDialog(context);
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
            widget.currentServiceController.clear();
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
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Create Account',
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
                        labelText: 'Name',
                        keyboardType: TextInputType.name,
                        validator: nameValidator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.emailController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.phoneNum1Controller,
                        labelText: 'Phone number 1',
                        validator: phoneValidator,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.phoneNum2Controller,
                        labelText: 'Phone number 2',
                        validator: phoneValidator,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.nationalIDController,
                        labelText: 'National ID',
                        keyboardType: TextInputType.number,
                        validator: nationalIdValidator,
                      ),
                      const SizedBox(height: 15),
                      ChoosePrivilage(
                        items: items,
                        selectedItem: selectedItem,
                        onChanged: (newValue) {
                          setState(() {
                            selectedItem = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      ChooseYourChurch(
                        items: churchItems,
                        selectedItem: churchSelectedItem,
                        onChanged: (newValue) {
                          setState(() {
                            churchSelectedItem = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.passwordController,
                        labelText: 'Password',
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
                        labelText: 'Confirm Password',
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
                        labelText: 'Number of home',
                        validator: numberOfHomeValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.streetNameController,
                        labelText: 'Street name',
                        validator: streetNameValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.addressOfAreaController,
                        labelText: 'Address of area',
                        validator: addressOfAreaValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.qualificationController,
                        labelText: 'Educational qualification',
                        validator: educationalQualificationValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController:
                            widget.fatherOfConfessionController,
                        labelText: 'Father of confession',
                        validator: fatherOfConessionValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.currentServiceController,
                        labelText: 'Current service in 2023/2024',
                        validator: currentServiceValidator,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 50),
                      CustomTextButton(
                        textButton: "Create Account",
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
                              numberOfnumber:
                                  widget.numberOfHomeController.text,
                              qualification:
                                  widget.qualificationController.text,
                              streetName: widget.streetNameController.text,
                              addressOfArea:
                                  widget.addressOfAreaController.text,
                              currentService:
                                  widget.currentServiceController.text,
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
