import 'package:animate_do/animate_do.dart';
import 'package:faithful_servant/core/helper/constant.dart';
import 'package:faithful_servant/core/helper/styles.dart';
import 'package:faithful_servant/features/all_servants/presentation/manager/all_servants_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

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
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RawScrollbar(
                  thickness: 6,
                  interactive: true,
                  radius: const Radius.circular(20),
                  child: ListView.builder(
                    itemCount: state.serviceUsers.length,
                    itemBuilder: (context, index) {
                      return FadeInDown(
                        duration: const Duration(milliseconds: 400),
                        animate: true,
                        curve: Curves.easeInOut,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              leading: CircleAvatar(
                                radius: 26,
                                backgroundImage: NetworkImage(
                                    state.serviceUsers[index].image),
                              ),
                              title: Text(
                                state.serviceUsers[index].name,
                              ),
                              subtitle:
                                  Text(state.serviceUsers[index].privilage),
                              trailing: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.delete,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
