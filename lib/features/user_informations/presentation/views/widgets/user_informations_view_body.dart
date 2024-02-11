import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/widgets/custom_text_button.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'information_item.dart';

class UserInformationsViewBody extends StatelessWidget {
  const UserInformationsViewBody({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 86,
                backgroundColor: kPrimaryLightColor,
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(userModel.image),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InformationItem(
              itemName: 'Name : '.tr,
              itemValue: userModel.name,
            ),
            InformationItem(
              itemName: 'Email : '.tr,
              itemValue: userModel.email,
            ),
            InformationItem(
              itemName: 'phone : '.tr,
              itemValue: userModel.phoneNum1,
            ),
            InformationItem(
              itemName: 'phone : '.tr,
              itemValue: userModel.phoneNum2,
            ),
            InformationItem(
              itemName: 'Qualification : '.tr,
              itemValue: userModel.qualification,
            ),
            InformationItem(
              itemName: 'National ID : '.tr,
              itemValue: userModel.nationalId,
            ),
            InformationItem(
              itemName: 'Address : '.tr,
              itemValue: '${userModel.numberOfnumber} ب${userModel.streetName}',
            ),
            InformationItem(
              itemName: 'Name of area : '.tr,
              itemValue: userModel.addressOfArea,
            ),
            InformationItem(
              itemName: 'Church : '.tr,
              itemValue: churchNamesBasedOnCode[userModel.church],
            ),
            InformationItem(
              itemName: 'Service : '.tr,
              itemValue: userModel.currentService,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: CustomTextButton(
                textButton: 'Modifie Informaion',
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
