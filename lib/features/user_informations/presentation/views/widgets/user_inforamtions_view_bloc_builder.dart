import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/loading_indicator.dart';
import 'package:faithful_servant/features/user_informations/presentation/manager/cubit/user_informations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_informations_view_body.dart';

class UserInformationsViewBlocBuilder extends StatelessWidget {
  const UserInformationsViewBlocBuilder({super.key, required this.personal});

  final bool personal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInformationsCubit, UserInformationsState>(
      builder: (context, state) {
        if (state is UserInformationsGetUserInformationsLoading) {
          return const LoadingIndicator();
        } else if (state is UserInformationsGetUserInformationsSuccess) {
          return UserInformationsViewBody(
            userModel: state.userModel,
            personal: personal,
          );
        } else {
          return const Text(
            'Can\'t fetch the informations, please try again later',
            style: Styles.textStyle30,
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
}
