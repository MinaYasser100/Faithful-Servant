import 'package:faithful_servant/core/function/get_user_data.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/all_servants/presentation/manager/all_servants_cubit.dart';
import 'package:faithful_servant/features/register/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'all_servant_list_view_for_stage.dart';

class AllServantsBodyForStage extends StatefulWidget {
  const AllServantsBodyForStage({
    super.key,
    required this.currentService,
    this.isGeneralServant = false,
  });
  final String currentService;
  final bool isGeneralServant;

  @override
  State<AllServantsBodyForStage> createState() =>
      _AllServantsBodyForStageState();
}

class _AllServantsBodyForStageState extends State<AllServantsBodyForStage> {
  late UserModel? userModel;
  void getUserModel() async {
    userModel = await getUserData();
  }

  @override
  void initState() {
    getUserModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllServantsCubit, AllServantsStates>(
        builder: (context, state) {
      return RefreshIndicator(
        onRefresh: () async {
          context
              .read<AllServantsCubit>()
              .getAllServantForStage(currentService: widget.currentService);
        },
        child: BlocBuilder<AllServantsCubit, AllServantsStates>(
          builder: (context, state) {
            if (state is AllServantsCubitGetAllServantForStageFailure) {
              return Center(
                child: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is AllServantsCubitGetAllServantForStageSuccess &&
                state.serviceUsers.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'There are no servants yet at this stage'.tr,
                      style: Styles.textStyle20PrimaryColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            } else if (state is AllServantsCubitGetAllServantForStageSuccess &&
                state.serviceUsers.isNotEmpty) {
              List<UserModel> servants = state.serviceUsers
                  .where(
                      (servant) => !servant.userID.contains(userModel!.userID))
                  .toList();
              return AllServantListViewForStage(
                serviceUsers: servants,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );
    });
  }
}
