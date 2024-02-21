import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:faithful_servant/features/user_informations/presentation/manager/cubit/user_informations_cubit.dart';
import 'package:faithful_servant/features/user_informations/presentation/views/widgets/information_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ShowUserInformations extends StatelessWidget {
  const ShowUserInformations({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          itemName: 'Qualified : '.tr,
          itemValue: userModel.qualification,
        ),
        InformationItem(
          itemName: 'birth date : '.tr,
          itemValue: userModel.brithDate,
        ),
        InformationItem(
          itemName: 'Age : '.tr,
          itemValue: (BlocProvider.of<UserInformationsCubit>(context)
                  .calculateAge(userModel.brithDate))
              .toString(),
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
          itemName: 'Father: '.tr,
          itemValue: userModel.fatherOfConfession,
        ),
        InformationItem(
          itemName: 'Service : '.tr,
          itemValue: userModel.currentService,
        ),
      ],
    );
  }
}
