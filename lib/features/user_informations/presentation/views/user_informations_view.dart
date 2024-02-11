import 'package:faithful_servant/core/widgets/appbar.dart';
import 'package:faithful_servant/features/user_informations/presentation/manager/cubit/user_informations_cubit.dart';
import 'package:faithful_servant/features/user_informations/presentation/views/widgets/user_inforamtions_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class UserInformationsView extends StatelessWidget {
  const UserInformationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInformationsCubit()..getUserInformations(),
      child: Scaffold(
        appBar: GeneralAppBar(
          title: 'Your Informations'.tr,
          appBar: AppBar(),
        ),
        body: const UserInformationsViewBlocBuilder(),
      ),
    );
  }
}
