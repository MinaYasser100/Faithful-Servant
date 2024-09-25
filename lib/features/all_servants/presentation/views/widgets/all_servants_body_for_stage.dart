import 'package:faithful_servant/features/all_servants/presentation/manager/all_servants_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            } else if (state is AllServantsCubitGetAllServantForStageSuccess) {
              return ListView.builder(
                itemCount: state.serviceUsers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                    state.serviceUsers[index].name,
                  ));
                },
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
