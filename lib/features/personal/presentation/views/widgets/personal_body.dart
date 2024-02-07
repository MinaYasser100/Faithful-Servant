import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/personal/presentation/manager/cubit/personal_cubit.dart';
import 'package:faithful_servant/features/personal/presentation/views/widgets/personal_image_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../../core/function/logout_method.dart';

class PersonalBody extends StatelessWidget {
  const PersonalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonalCubit()..init(),
      child: Column(
        children: [
          const SizedBox(height: 30),
          BlocBuilder<PersonalCubit, PersonalState>(
            builder: (context, state) {
              if (state is PersonalPersonaldatafetchloading) {
                return const CircularProgressIndicator();
              } else if (state is PersonalPersonaldatafetchsuccess) {
                return PersonalImageAndName(
                    name: BlocProvider.of<PersonalCubit>(context).name!,
                    url: BlocProvider.of<PersonalCubit>(context)
                        .personalImageUrl!);
              } else {
                return const PersonalImageAndName(name: 'Error!', url: '');
              }
            },
          ),
          const Divider(endIndent: 50, indent: 50),
          Expanded(
            child: ListView.builder(
              itemCount: personalPages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    personalPages[index]['title'] != "تسجيل الخروج"
                        ? Get.toNamed(personalPages[index]['routto'])
                        : logoutMethod(context);
                  },
                  title: Text(
                    personalPages[index]['title'],
                    style: Styles.textStyle16,
                  ),
                  leading: personalPages[index]['icon'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
