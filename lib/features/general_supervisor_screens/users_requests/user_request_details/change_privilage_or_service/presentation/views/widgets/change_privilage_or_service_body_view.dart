import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/features/general_supervisor_screens/users_requests/user_request_details/change_privilage_or_service/presentation/manager/cubit/change_privilage_or_service_cubit.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:faithful_servant/features/register/presentation/views/widgets/choose_form_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ChangePrivilageOrServiceBodyView extends StatefulWidget {
  const ChangePrivilageOrServiceBodyView({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<ChangePrivilageOrServiceBodyView> createState() =>
      _ChangePrivilageOrServiceBodyViewState();
}

class _ChangePrivilageOrServiceBodyViewState
    extends State<ChangePrivilageOrServiceBodyView> {
  late String selectedItem;
  late String selectCurrentService;
  late String selectCurrentService2;

  final List<String> items = [
    'خادم',
    'امين اسرة',
    'امين اسرة مساعد',
    'امين قطاع',
    'امين قطاع مساعد',
    'المشرف العام',
  ];

  @override
  void initState() {
    super.initState();
    selectedItem = widget.userModel.role;

    // Ensure that the initial selection matches one of the items in the list
    if (currentServiceItems.contains(widget.userModel.currentService)) {
      selectCurrentService = widget.userModel.currentService;
    } else {
      selectCurrentService = currentServiceItems.first;
    }

    if (sectors.contains(widget.userModel.currentService)) {
      selectCurrentService2 = widget.userModel.currentService;
    } else {
      selectCurrentService2 = sectors.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<ChangePrivilageOrServiceCubit,
          ChangePrivilageOrServiceState>(
        builder: (context, state) {
          return Column(
            children: [
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
              if (selectedItem != 'امين قطاع' &&
                  selectedItem != 'امين قطاع مساعد')
                ChooseFromItems(
                  items: currentServiceItems,
                  selectedItem: selectCurrentService,
                  onChanged: (newValue) {
                    setState(() {
                      selectCurrentService = newValue!;
                    });
                  },
                ),
              if (selectedItem == 'امين قطاع' ||
                  selectedItem == 'امين قطاع مساعد')
                ChooseFromItems(
                  items: sectors,
                  selectedItem: selectCurrentService2,
                  onChanged: (newValue) {
                    setState(() {
                      selectCurrentService2 = newValue!;
                    });
                  },
                ),
              const SizedBox(height: 30),
              CustomTextButton(
                  textButton: 'edit'.tr,
                  onPressed: () {
                    context
                        .read<ChangePrivilageOrServiceCubit>()
                        .changeServantPrivilageOrService(
                          userModel: UserModel(
                            userID: widget.userModel.userID,
                            name: widget.userModel.name,
                            email: widget.userModel.email,
                            phoneNum1: widget.userModel.phoneNum1,
                            phoneNum2: widget.userModel.phoneNum2,
                            image: widget.userModel.image,
                            nationalId: widget.userModel.nationalId,
                            privilage: widget.userModel.privilage,
                            church: widget.userModel.church,
                            gender: widget.userModel.gender,
                            numberOfnumber: widget.userModel.numberOfnumber,
                            streetName: widget.userModel.streetName,
                            addressOfArea: widget.userModel.addressOfArea,
                            qualification: widget.userModel.qualification,
                            currentService: (selectedItem == 'امين قطاع' ||
                                    selectedItem == 'امين قطاع مساعد')
                                ? selectCurrentService2
                                : selectCurrentService,
                            fatherOfConfession:
                                widget.userModel.fatherOfConfession,
                            brithDate: widget.userModel.brithDate,
                            role: selectedItem,
                            isActive: widget.userModel.isActive,
                          ),
                          buildContext: context,
                        );
                  })
            ],
          );
        },
      ),
    );
  }
}
