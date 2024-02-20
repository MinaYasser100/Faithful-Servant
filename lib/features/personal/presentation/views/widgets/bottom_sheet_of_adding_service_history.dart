import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/features/personal/data/Models/services_history_model/service_history_model.dart';
import 'package:faithful_servant/features/personal/data/controllers/controllers_of_add_history_service.dart';
import 'package:faithful_servant/features/personal/presentation/manager/history_of_service_cubit/history_of_service_cubit.dart';
import 'package:faithful_servant/features/personal/presentation/manager/validators/add_history_servant_validator.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/choose_form_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BottomSheetOfAddingOrEditingServiceHistory extends StatefulWidget {
  const BottomSheetOfAddingOrEditingServiceHistory({super.key, this.data});

  static const double spaces = 10;
  final ServiceHistoryModel? data;

  @override
  State<BottomSheetOfAddingOrEditingServiceHistory> createState() =>
      _BottomSheetOfAddingOrEditingServiceHistoryState();
}

class _BottomSheetOfAddingOrEditingServiceHistoryState
    extends State<BottomSheetOfAddingOrEditingServiceHistory> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Text(
            'تسجيل خدمة',
            style: Styles.textStyle25SecondColor
                .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
              height: BottomSheetOfAddingOrEditingServiceHistory.spaces),
          Row(
            children: [
              Text(
                'الخدمة',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: ChooseFromItems(
                  items: currentServiceItems,
                  selectedItem: selectedservice,
                  onChanged: (value) {
                    AddServiceHistoryControllers.historyservicecontroller.text =
                        value!;
                    setState(() {
                      selectedservice = value;
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(
              height: BottomSheetOfAddingOrEditingServiceHistory.spaces),
          Row(
            children: [
              Text(
                'الدور',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 25),
              Expanded(
                child: ChooseFromItems(
                  items: currentrolesItems,
                  selectedItem: selectedrole,
                  onChanged: (value) {
                    AddServiceHistoryControllers.historyrolecontroller.text =
                        value!;
                    setState(() {
                      selectedrole = value;
                    });
                  },
                ),
              )
            ],
          ),
          const SizedBox(
              height: BottomSheetOfAddingOrEditingServiceHistory.spaces),
          Row(
            children: [
              Text(
                'المدة  ',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 9),
              Expanded(
                child: CustomTextFromField(
                  textEditingController:
                      AddServiceHistoryControllers.historydurationcontroller,
                  labelText: 'مدة الخدمة',
                  validator: durationvalidator,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(
              height: BottomSheetOfAddingOrEditingServiceHistory.spaces),
          Row(
            children: [
              Text(
                'المكان',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ChooseFromItems(
                  items: placesItems,
                  selectedItem: selectedplace,
                  onChanged: (value) {
                    AddServiceHistoryControllers.historyplacecontroller.text =
                        value!;
                    setState(() {
                      selectedplace = value;
                    });
                    if (value == 'اخري') {
                      BlocProvider.of<HistoryOfServiceCubit>(context)
                          .emitelesplace();
                    } else {
                      BlocProvider.of<HistoryOfServiceCubit>(context)
                          .emitEditModeCard();
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
              height: BottomSheetOfAddingOrEditingServiceHistory.spaces),
          BlocBuilder<HistoryOfServiceCubit, HistoryOfServiceState>(
            builder: (context, state) {
              if (state is Selectedelseplace) {
                return SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: CustomTextFromField(
                          textEditingController: AddServiceHistoryControllers
                              .historyplacecontroller,
                          labelText: 'مكان اخر',
                          validator: elseplacevalidator,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox(height: 0);
              }
            },
          ),
          ElevatedButton.icon(
            style: const ButtonStyle(
                iconColor: MaterialStatePropertyAll(kSecondColor),
                backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
            onPressed: () async {
              EasyLoading.show(status: 'تحميل ...');
              // add here function of sending data to firebase
              EasyLoading.dismiss();
              Get.back();
            },
            icon: const Icon(Icons.send),
            label: Text(
              'تاكيد',
              style: Styles.textStyle16SecondColor
                  .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ));
  }
}
