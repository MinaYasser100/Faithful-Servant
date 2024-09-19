import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/core/widgets/navigation_back_button.dart';
import 'package:faithful_servant/features/ma5domeen/data/model/ma5domeen_model.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_states.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/edit_ma5domeen_widgets/section1_edit_ma5domeen_data.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/edit_ma5domeen_widgets/section2_edit_ma5domeen_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditMa5domeenViewBodyContent extends StatefulWidget {
  const EditMa5domeenViewBodyContent({
    super.key,
    required this.fromKey,
    required this.nameController,
    required this.phoneNumber1Controller,
    required this.qualificationController,
    required this.fatherOfConfessionController,
    required this.addressController,
    required this.phoneNumber2Controller,
    required this.dateController,
    required this.ma5domeenModel,
  });

  final GlobalKey<FormState> fromKey;
  final TextEditingController nameController;
  final TextEditingController phoneNumber1Controller;
  final TextEditingController phoneNumber2Controller;
  final TextEditingController qualificationController;
  final TextEditingController addressController;
  final TextEditingController fatherOfConfessionController;
  final TextEditingController dateController;
  final Ma5domeenModel ma5domeenModel;
  @override
  State<EditMa5domeenViewBodyContent> createState() =>
      _EditMa5domeenViewBodyContent();
}

class _EditMa5domeenViewBodyContent
    extends State<EditMa5domeenViewBodyContent> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Ma5domeenCubit, Ma5domeenStates>(
      listener: (context, state) {
        if (state is EditMa5domeenDataLoading) {
          EasyLoading.show(
            status: 'Loading...'.tr,
          );
        }
        if (state is EditMa5domeenDataFailure) {
          EasyLoading.show(
            status: state.errorMessage,
          );
        }
        if (state is EditMa5domeenDataSuccess) {
          EasyLoading.dismiss();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('The data has been updated successfully'.tr),
            ),
          );
          Get.offNamed(
            GetPages.ma5domeenView,
            arguments: widget.ma5domeenModel.stagename,
          );
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const NavigationBackButton(),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Modifie Informaion'.tr,
                    style: Styles.textStyle30,
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: widget.fromKey,
                    autovalidateMode: BlocProvider.of<Ma5domeenCubit>(context)
                        .autovalidateMode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Section1EditMa5domeenData(widget: widget),
                        const SizedBox(height: 15),
                        CustomTextFromField(
                          textEditingController: widget.dateController,
                          labelText: 'MM/dd/yyyy'.tr,
                          readOnly: true,
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
                        Section2EditMa5domeenData(widget: widget),
                        const SizedBox(height: 50),
                        CustomTextButton(
                          textButton: 'Edit'.tr,
                          onPressed: () {
                            if (widget.fromKey.currentState!.validate()) {
                              implementEditMa5doomButtton(
                                  context, widget.ma5domeenModel.stagename);
                            } else {
                              BlocProvider.of<Ma5domeenCubit>(context)
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
          ),
        );
      },
    );
  }

  void implementEditMa5doomButtton(BuildContext context, String namestage) {
    BlocProvider.of<Ma5domeenCubit>(context).editMa5domeenData(
        name: widget.nameController.text,
        phoneNumber1: widget.phoneNumber1Controller.text,
        phoneNumber2: widget.phoneNumber2Controller.text,
        birthdate: widget.dateController.text,
        address: widget.addressController.text,
        qualification: widget.qualificationController.text,
        fatherOfConfession: widget.fatherOfConfessionController.text,
        namestage: namestage,
        ma5domeenModel1: widget.ma5domeenModel);
    controllerDelete();
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

  void controllerDelete() {
    widget.addressController.clear();
    widget.dateController.clear();
    widget.fatherOfConfessionController.clear();
    widget.nameController.clear();
    widget.phoneNumber1Controller.clear();
    widget.phoneNumber2Controller.clear();
    widget.qualificationController.clear();
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
