import 'package:faithful_servant/core/function/screen_action/successfully_show_dialog.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/core/widgets/navigation_back_button.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_states.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/addMa5domeen_widgets/section1AddMa5domeen.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/addMa5domeen_widgets/section2Ma5domeen.dart';
import 'package:faithful_servant/features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Addma5domeenviewbodyContent extends StatefulWidget {
  const Addma5domeenviewbodyContent({
    super.key,
    required this.fromKey,
    required this.nameController,
    required this.phoneNumber1Controller,
    required this.qualificationController,
    required this.fatherOfConfessionController,
    required this.addressController,
    required this.phoneNumber2Controller,
    required this.dateController, required this.namestage,
  });

  final GlobalKey<FormState> fromKey;
  final TextEditingController nameController;
  final TextEditingController phoneNumber1Controller;
  final TextEditingController phoneNumber2Controller;
  final TextEditingController qualificationController;
  final TextEditingController addressController;
  final TextEditingController fatherOfConfessionController;
  final TextEditingController dateController;
final String namestage;
  @override
  State<Addma5domeenviewbodyContent> createState() => _Addma5domeenviewbodyContent();
}

class _Addma5domeenviewbodyContent extends State<Addma5domeenviewbodyContent> {
 

  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<Ma5domeenCubit, Ma5domeenStates>(
        listener: (context, state) {
          if (state is Loading ) {
            EasyLoading.show(
              status: 'Loading...'.tr,
            );
          }
          if (state is PutMa5domeenDataSuccess) {
            EasyLoading.dismiss();
            successfullyShowDialog(
                context: context,
                titleText: 'Successfully added'.tr,
                contentText:
                    'The registration is successful, now go to the login'.tr,
                buttonText: 'Go To Login'.tr,
                onPressed: () {
                 // Get.offNamed(GetPages.kLoginView);
                });
          }
         
        },
        builder: (context, state) {
          return 
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NavigationBackButton(),
                const SizedBox(height: 50),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "add ma5doom",
                    style: Styles.textStyle30,
                  ),
                ),
                const SizedBox(height: 30),
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: widget.fromKey,
                    autovalidateMode:
                        BlocProvider.of<Ma5domeenCubit>(context).autovalidateMode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Section1addma5domeen(widget: widget),
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
                        Section2ma5domeen(widget: widget),
                        const SizedBox(height: 50),
                        CustomTextButton(
                          textButton: 'Add',
                          onPressed: () {
                            if (widget.fromKey.currentState!.validate()) {
                              implementAddMa5doomButtton(context, widget.namestage);
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
            ),
          );
        },
      ),
    );
  }

  void implementAddMa5doomButtton(BuildContext context , String namestage) {
    BlocProvider.of<Ma5domeenCubit>(context).putMa5domeenDataInFirebase(name: widget.nameController.text, phoneNumber1:widget.phoneNumber1Controller.text, phoneNumber2: widget.phoneNumber2Controller.text, birthdate:widget.dateController.text, address: widget.addressController.text, qualification: widget.qualificationController.text, fatherOfConfession:widget.fatherOfConfessionController.text, namestage: namestage);
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

  @override
  void dispose() {
    widget.nameController;
    widget.addressController;
    widget.phoneNumber1Controller;
    widget.phoneNumber2Controller;
    widget.qualificationController;
    widget.dateController;
    widget.fatherOfConfessionController;
    super.dispose();
  }
}
