import 'package:animate_do/animate_do.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_cubit.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/manager/ma5domeen_states.dart';
import 'package:faithful_servant/features/ma5domeen/presentation/view/widgets/ma5domeen_widgets/ma5domeen_body_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ma5domeenBody extends StatefulWidget {
  const Ma5domeenBody({
    super.key,
    required this.nameStage,
    this.isServant = false,
  });
  final String nameStage;
  final bool isServant;
  @override
  State<Ma5domeenBody> createState() => _Ma5domeenBodyState();
}

class _Ma5domeenBodyState extends State<Ma5domeenBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<Ma5domeenCubit>().gettingMa5domeenData(widget.nameStage);
      },
      child: BlocBuilder<Ma5domeenCubit, Ma5domeenStates>(
        builder: (context, state) {
          if (state is Ma5domeenCubitGetMa5domeenDataFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                textAlign: TextAlign.center,
              ),
            );
          } else if (state is Ma5domeenCubitGetMa5domeenDataSuccess) {
            return ListView.builder(
              itemCount: state.ma5domeenData.length,
              itemBuilder: (context, index) {
                return FadeInDown(
                  duration: const Duration(milliseconds: 400),
                  animate: true,
                  curve: Curves.easeInOut,
                  child: Ma5domeenBodyContent(
                    stageName: widget.nameStage,
                    ma5domeenModel: state.ma5domeenData[index],
                    isServant: widget.isServant,
                  ),
                );
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
  }
}
