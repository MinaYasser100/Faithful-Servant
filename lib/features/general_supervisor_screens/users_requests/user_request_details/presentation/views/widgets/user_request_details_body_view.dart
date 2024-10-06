import 'package:animate_do/animate_do.dart';
import 'package:faithful_servant/core/function/calculate_age.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../../all_servants/servant_details/presentation/views/widgets/servant_info_item_widget.dart';
import '../../manager/get_user_request_details_cubit.dart';

class UserRequestDetailsBodyView extends StatelessWidget {
  const UserRequestDetailsBodyView({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserRequestDetailsCubit(),
      child:
          BlocBuilder<GetUserRequestDetailsCubit, GetUserRequestDetailsStates>(
        builder: (context, state) {
          if (state is GetUserRequestDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetUserRequestDataFailure) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }

          // Default to the passed-in userModel if state is not success
          final UserModel displayUserModel =
              (state is GetUserRequestDataSuccess)
                  ? state.userModel
                  : userModel;

          // Servant details and titles
          List<String> servantDetails = [
            displayUserModel.name,
            displayUserModel.email,
            displayUserModel.nationalId,
            displayUserModel.brithDate,
            calculateAge(displayUserModel.brithDate).toString(),
            displayUserModel.phoneNum1,
            displayUserModel.phoneNum2,
            displayUserModel.qualification,
            displayUserModel.role,
            displayUserModel.currentService,
            '${displayUserModel.numberOfnumber} ${displayUserModel.streetName} ${displayUserModel.addressOfArea}',
            displayUserModel.fatherOfConfession,
          ];
          List<String> servantTitle = [
            'الاسم',
            'الايميل',
            'الرقم القومي',
            'تاريخ الميلاد',
            'العمر',
            'رقم الهاتف 1',
            'رقم الهاتف 2',
            'المؤهل',
            'المنصب الكنسي',
            'الخدمة الحالية',
            'العنوان',
            'أب الاعتراف',
          ];

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: RawScrollbar(
              interactive: true,
              thickness: 5,
              radius: const Radius.circular(20),
              thumbColor: kPrimaryColor,
              child: RefreshIndicator(
                onRefresh: () async {
                  await context
                      .read<GetUserRequestDetailsCubit>()
                      .getUserRequestData(userModel: userModel);
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(10),
                        itemCount: servantDetails.length,
                        itemBuilder: (context, index) => FadeInDown(
                          duration: const Duration(milliseconds: 400),
                          animate: true,
                          curve: Curves.easeInOut,
                          child: ServantInfoItemWidget(
                            title: servantTitle[index],
                            value: servantDetails[index],
                          ),
                        ),
                        separatorBuilder: (context, index) => const Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: TextButton(
                          child: Text('Change Privilage or Service'.tr),
                          onPressed: () {
                            Get.toNamed(
                              GetPages.kChangePrivilageOrServiceView,
                              arguments: displayUserModel,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
