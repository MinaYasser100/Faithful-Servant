import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/features/personal/data/controllers/controllers_of_add_history_service.dart';
import 'package:faithful_servant/features/personal/presentation/manager/history_of_service_cubit/history_of_service_cubit.dart';
import 'package:faithful_servant/features/personal/presentation/manager/validators/add_history_servant_validator.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/choose_form_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../functions/submet_new_history.dart';

class BottomSheetOfAddingServiceHistory extends StatefulWidget {
  const BottomSheetOfAddingServiceHistory({super.key});

  static const double spaces = 10;

  @override
  State<BottomSheetOfAddingServiceHistory> createState() =>
      _BottomSheetOfAddingServiceHistoryState();
}

class _BottomSheetOfAddingServiceHistoryState
    extends State<BottomSheetOfAddingServiceHistory> {
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
          const SizedBox(height: BottomSheetOfAddingServiceHistory.spaces),
          Row(
            children: [
              Text(
                'الخدمة',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: ChooseFromItems(
                    items: currentServiceItems,
                    selectedItem: selectedservice,
                    onChanged: (value) {
                      AddServiceHistoryControllers.historyplacecontroller.text =
                          value!;
                      setState(() {
                        selectedservice = value;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: BottomSheetOfAddingServiceHistory.spaces),
          Row(
            children: [
              Text(
                'المدة  ',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: CustomTextFromField(
                    textEditingController:
                        AddServiceHistoryControllers.historydurationcontroller,
                    labelText: 'مدة الخدمة',
                    validator: durationvalidator,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: BottomSheetOfAddingServiceHistory.spaces),
          Row(
            children: [
              Text(
                'المكان',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.73,
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
                            .emitini();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: BottomSheetOfAddingServiceHistory.spaces),
          BlocBuilder<HistoryOfServiceCubit, HistoryOfServiceState>(
            builder: (context, state) {
              if (state is Selectedelseplace) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.88,
                        child: CustomTextFromField(
                          textEditingController: AddServiceHistoryControllers
                              .historyplacecontroller,
                          labelText: 'مكان اخر',
                          validator: elseplacevalidator,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
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
              await submetNewHistory();
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
