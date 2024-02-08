import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/custom_text_from_field.dart';
import 'package:faithful_servant/features/personal/data/Models/services_history_model/service_history_model.dart';
import 'package:faithful_servant/features/personal/data/controllers/controllers_of_add_history_service.dart';
import 'package:faithful_servant/features/personal/presentation/functions/set_initial_value_of_edit_mode_history_card.dart';
import 'package:faithful_servant/features/personal/presentation/manager/validators/add_history_servant_validator.dart';
import 'package:faithful_servant/features/personal/presentation/views/widgets/bottom_sheet_of_adding_service_history.dart';
import 'package:faithful_servant/features/personal/presentation/views/widgets/buttons_of_edit_mode_history_card.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/choose_form_items.dart';
import 'package:flutter/material.dart';

class EditModeHistoryCard extends StatefulWidget {
  const EditModeHistoryCard(
      {super.key, required this.index, required this.data});
  final int index;
  final ServiceHistoryModel data;
  @override
  State<EditModeHistoryCard> createState() => _EditModeHistoryCardState();
}

class _EditModeHistoryCardState extends State<EditModeHistoryCard> {
  @override
  Widget build(BuildContext context) {
    init(widget.data);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Card(
          color: kSecondColor,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'الخدمة  ',
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.748,
                      child: ChooseFromItems(
                        items: currentServiceItems,
                        selectedItem: initialservice,
                        onChanged: (value) {
                          setState(() {
                            AddServiceHistoryControllers
                                .historyservicecontroller.text = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: BottomSheetOfAddingServiceHistory.spaces),
                Row(
                  children: [
                    Text(
                      'الدور',
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.748,
                        child: ChooseFromItems(
                          items: currentrolesItems,
                          selectedItem: initialrole,
                          onChanged: (value) {
                            setState(() {
                              AddServiceHistoryControllers
                                  .historyrolecontroller.text = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: BottomSheetOfAddingServiceHistory.spaces),
                Row(
                  children: [
                    Text(
                      'المدة',
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: CustomTextFromField(
                          textEditingController: AddServiceHistoryControllers
                              .historydurationcontroller,
                          labelText: 'مدة الخدمة',
                          validator: durationvalidator,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: BottomSheetOfAddingServiceHistory.spaces),
                Row(
                  children: [
                    Text(
                      'المكان',
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.74,
                        child: ChooseFromItems(
                          items: placesItems,
                          selectedItem: initialplace,
                          onChanged: (value) {
                            setState(() {
                              initialplace = value!;
                            });
                            if (value != 'اخري') {
                              AddServiceHistoryControllers
                                  .historyplacecontroller.text = value!;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    height: BottomSheetOfAddingServiceHistory.spaces),
                Row(
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
                ),
              ],
            ),
          ),
        ),
        const ButtonsOfEditModeHistoryCard()
      ],
    );
  }
}
