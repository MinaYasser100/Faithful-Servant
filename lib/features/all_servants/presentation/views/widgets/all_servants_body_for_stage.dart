import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/all_servants/presentation/manager/all_servants_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'all_servant_list_view_for_stage.dart';

class AllServantsBodyForStage extends StatelessWidget {
  const AllServantsBodyForStage({super.key, required this.currentService});
  final String currentService;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllServantsCubit, AllServantsStates>(
        builder: (context, state) {
      return RefreshIndicator(
        onRefresh: () async {
          context
              .read<AllServantsCubit>()
              .getAllServantForStage(currentService: currentService);
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
              return AllServantListViewForStage(
                serviceUsers: state.serviceUsers,
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
