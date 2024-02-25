import 'package:faithful_servant/core/function/screen_action/custom_sanck_bar.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/core/widgets/navigation_back_button.dart';
import 'package:faithful_servant/features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:faithful_servant/features/register/presentation/views/function/determind_church.dart';
import 'package:faithful_servant/features/register/presentation/views/function/register_failure_show_dialog.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/choose_form_items.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/image_register_widget.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/section_one_in_register.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/section_two_in_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../core/function/screen_action/successfully_show_dialog.dart';

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
    required this.dateController,
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
  final TextEditingController dateController;

  @override
  State<ReisterViewBodyContent> createState() => _ReisterViewBodyContentState();
}

class _ReisterViewBodyContentState extends State<ReisterViewBodyContent> {
  // final List<String> items = [
  //   'خادم',
  //   'امين الخدمة',
  //   'امين قطاع',
  //   'المشرف العام'
  // ];
  final List<String> items = [
    'خادم',
    'امين اسرة',
    'امين اسرة مساعد',
    'امين قطاع',
    'امين قطاع مساعد',
    'المشرف العام',
  ];
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
  DateTime? selectedDate;
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
                onPressed: () {
                  Get.offNamed(GetPages.kLoginView);
                });
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
              const ImgeRegisterWidget(),
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
                      SectionOneInRegister(widget: widget),
                      const SizedBox(height: 15),
                      CustomTextFromField(
                        textEditingController: widget.dateController,
                        labelText: 'MM/dd/yyyy'.tr,
                        validator: (p0) {
                          return null;
                        },
                        iconData: Icons.date_range_outlined,
                        suffixOnPressed: () {
                          selectDate(context);
                        },
                        keyboardType: TextInputType.datetime,
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
                      SectionTwoInRegister(widget: widget),
                      const SizedBox(height: 50),
                      CustomTextButton(
                        textButton: 'Create Account'.tr,
                        onPressed: () {
                          if (widget.fromKey.currentState!.validate()) {
                            implementCreateNewAccountButtton(context);
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

  void implementCreateNewAccountButtton(BuildContext context) {
    BlocProvider.of<RegisterCubit>(context).userRegistration(
      name: widget.nameController.text,
      email: widget.emailController.text,
      password: widget.passwordController.text,
      phoneNum1: widget.phoneNum1Controller.text,
      phoneNum2: widget.phoneNum2Controller.text,
      image: BlocProvider.of<RegisterCubit>(context).imageSelected ??
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzb62jTDtJjG9KgljxtM0vPyWOq_16WOkIgA&usqp=CAU',
      nationalId: widget.nationalIDController.text,
      role: selectedItem,
      church: determindChurch(
        churchSelectedItem: churchSelectedItem,
      ),
      gender: selectGenderItem,
      numberOfnumber: widget.numberOfHomeController.text,
      qualification: widget.qualificationController.text,
      streetName: widget.streetNameController.text,
      addressOfArea: widget.addressOfAreaController.text,
      currentService: selectCurrentService,
      fatherOfConfession: widget.fatherOfConfessionController.text,
      brithDate: widget.dateController.text,
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.dateController.text = selectedDate != null
            ? DateFormat('MM/dd/yyyy').format(selectedDate!)
            : '';
      });
    }
  }
}
