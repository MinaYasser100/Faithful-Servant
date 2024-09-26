import 'package:animate_do/animate_do.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/get_pages.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'servant_info_item_widget.dart';

class ServantDetailsBodyView extends StatelessWidget {
  const ServantDetailsBodyView({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    List<String> servantDetails = [
      userModel.name,
      userModel.email,
      userModel.nationalId,
      userModel.brithDate,
      userModel.phoneNum1,
      userModel.phoneNum2,
      userModel.qualification,
      userModel.role,
      userModel.currentService,
      '${userModel.numberOfnumber} ${userModel.streetName} ${userModel.addressOfArea}',
      userModel.fatherOfConfession,
    ];
    List<String> servantTitle = [
      'الاسم',
      'الايميل',
      'الرقم القومي',
      'تاريخ الميلاد',
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
                child: CustomTextButton(
                  textButton: 'Editing Informations'.tr,
                  onPressed: () {
                    Get.toNamed(GetPages.kModifieInformationsView,
                        arguments: {"userModel": userModel, "personal": false});
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
