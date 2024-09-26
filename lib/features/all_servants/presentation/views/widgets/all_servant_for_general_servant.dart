import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/core/widgets/design_body.dart';
import 'package:faithful_servant/features/all_servants/data/repo/all_servants_repo_implement.dart';
import 'package:faithful_servant/features/all_servants/presentation/manager/all_servants_cubit.dart';
import 'package:faithful_servant/features/all_servants/presentation/views/widgets/all_servants_body_for_stage.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllServantForGeneralServant extends StatelessWidget {
  const AllServantForGeneralServant({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future:
          getUserData(), // Replace with your actual method to get user model
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: kPrimaryColor,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return const Scaffold(
            backgroundColor: kPrimaryColor,
            body: Center(
              child: Text(
                'Error loading user data',
                style: Styles.textStyle20PrimaryColor,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          final userModel = snapshot.data!;
          return BlocProvider(
            create: (context) => AllServantsCubit(AllServantsRepoImplement())
              ..getAllServantForStage(currentService: userModel.currentService),
            child: Scaffold(
              backgroundColor: kPrimaryColor,
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                foregroundColor: kSecondColor,
                title: Text(
                  userModel.currentService,
                  style: Styles.textStyle25SecondColor,
                ),
              ),
              body: DesignBody(
                widget: AllServantsBodyForStage(
                  currentService: userModel.currentService,
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            backgroundColor: kPrimaryColor,
            body: Center(
              child: Text(
                'No user data available',
                style: Styles.textStyle20PrimaryColor,
              ),
            ),
          );
        }
      },
    );
  }
}
